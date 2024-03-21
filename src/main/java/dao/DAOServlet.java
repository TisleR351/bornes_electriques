package dao;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.fasterxml.jackson.databind.ObjectMapper;

import classes.Borne;
import io.github.cdimascio.dotenv.Dotenv;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DAOServletServlet", value = "/DAOServlet")
public class DAOServlet extends HttpServlet {
    private Connection connection;


    private void dbClose() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void dbConnect() throws SQLException {
        Dotenv dotenv = Dotenv.load();
        String dbUrl = dotenv.get("DB_URL");
        String dbPort = dotenv.get("DB_PORT");
        String dbName = dotenv.get("DB_NAME");
        String dbUser = dotenv.get("DB_USER");
        String dbPassword = dotenv.get("DB_PASSWORD");
        String url = "jdbc:mysql://" + dbUrl + ":" + dbPort + "/" + dbName;

        connection = DriverManager.getConnection(url, dbUser, dbPassword);
    }

    public void init() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("Cannot find the driver in the classpath!", e);
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            dbConnect();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Dotenv dotenv = Dotenv.load();
        List<Borne> bornes = new ArrayList<>();
        String tableName = dotenv.get("TABLE_NAME");
        double latitude = Double.parseDouble(request.getParameter("latitude"));
        double longitude = Double.parseDouble(request.getParameter("longitude"));
        try (PreparedStatement pstmt = connection.prepareStatement(
                "SELECT * FROM " + tableName + " " +
                        "ORDER BY SQRT(POWER(consolidated_latitude - ?, 2) + POWER(consolidated_longitude - ?, 2)) " +
                        "LIMIT 30")) {
            pstmt.setDouble(1, latitude);
            pstmt.setDouble(2, longitude);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Borne borne = new Borne(
                            rs.getString("nom_operateur"),
                            rs.getString("contact_operateur"),
                            rs.getString("telephone_operateur"),
                            rs.getString("nom_station"),
                            rs.getString("adresse_station"),
                            rs.getString("code_insee_commune"),
                            rs.getString("coordonneesXY"),
                            rs.getDouble("puissance_nominale"),
                            rs.getBoolean("prise_type_ef"),
                            rs.getBoolean("prise_type_2"),
                            rs.getBoolean("prise_type_combo_ccs"),
                            rs.getBoolean("prise_type_chademo"),
                            rs.getBoolean("prise_type_autre"),
                            rs.getBoolean("gratuit"),
                            rs.getBoolean("paiement_acte"),
                            rs.getBoolean("paiement_cb"),
                            rs.getBoolean("paiement_autre"),
                            rs.getString("tarification"),
                            rs.getString("condition_acces"),
                            rs.getBoolean("reservation"),
                            rs.getString("horaires"),
                            rs.getString("accessibilite_pmr"),
                            rs.getString("restriction_gabarit"),
                            rs.getBoolean("station_deux_roues"),
                            rs.getString("raccordement"),
                            rs.getDate("date_mise_en_service"),
                            rs.getString("observations"),
                            rs.getDate("date_maj"),
                            rs.getDouble("consolidated_longitude"),
                            rs.getDouble("consolidated_latitude"),
                            rs.getString("consolidated_commune")
                    );
                    bornes.add(borne);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbClose();
        }
        ObjectMapper mapper = new ObjectMapper();
        String jsonBornes = mapper.writeValueAsString(bornes);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(jsonBornes);
        out.flush();
    }

    public void destroy() {
    }
}