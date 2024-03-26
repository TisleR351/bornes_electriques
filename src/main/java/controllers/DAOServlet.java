package controllers;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.fasterxml.jackson.databind.ObjectMapper;

import modeles.Borne;
import io.github.cdimascio.dotenv.Dotenv;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DAOServletServlet", value = "/DAOServlet")
public class DAOServlet extends HttpServlet {
    private Connection connection;
    private String perimetre;
    private String puissance;
    private String prise_type_2;
    private String prise_type_ef;
    private String prise_type_chademo;
    private String prise_type_autre;
    private String prise_type_combo_ccs;
    private String accessibilite_pmr;
    private String reservation;
    private String gratuit;
    private String paiement_cb;
    private String paiement_autre;
    private String paiement_acte;


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

    public void cookiesRecovery(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie : cookies) {
            switch(cookie.getName()) {
                case "perimetre":
                    perimetre = cookie.getValue();
                    break;
                case "puissance":
                    puissance = cookie.getValue();
                    break;
                case "prise_type_2":
                    prise_type_2 = cookie.getValue();
                    break;
                case "prise_type_ef":
                    prise_type_ef = cookie.getValue();
                    break;
                case "prise_type_chademo":
                    prise_type_chademo = cookie.getValue();
                    break;
                case "prise_type_autre":
                    prise_type_autre = cookie.getValue();
                    break;
                case "prise_type_combo_ccs":
                    prise_type_combo_ccs = cookie.getValue();
                    break;
                case "accessibilite_pmr":
                    this.accessibilite_pmr = cookie.getValue();
                    break;
                case "reservation":
                    reservation = cookie.getValue();
                    break;
                case "gratuit":
                    gratuit = cookie.getValue();
                case "paiement_cb":
                    paiement_cb = cookie.getValue();
                case "paiement_autre":
                    paiement_autre = cookie.getValue();
                case "paiement_acte":
                    paiement_acte = cookie.getValue();
                    break;
                default:
                    break;
            }
        }
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            dbConnect();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        cookiesRecovery(request);
        Dotenv dotenv = Dotenv.load();
        List<Borne> bornes = new ArrayList<>();
        String tableName = dotenv.get("TABLE_NAME");
        double latitude = Double.parseDouble(request.getParameter("latitude"));
        double longitude = Double.parseDouble(request.getParameter("longitude"));
        String sql = "SELECT * FROM " + tableName + " WHERE 1=1";
        if (prise_type_2 != null && !prise_type_2.isEmpty()) {
            sql += " OR prise_type_2 = ?";
        }
        if (prise_type_ef != null && !prise_type_ef.isEmpty()) {
            sql += " OR prise_type_ef = ?";
        }
        if (prise_type_chademo != null && !prise_type_chademo.isEmpty()) {
            sql += " OR prise_type_chademo = ?";
        }
        if (prise_type_autre != null && !prise_type_autre.isEmpty()) {
            sql += " OR prise_type_autre = ?";
        }
        if (prise_type_combo_ccs != null && !prise_type_combo_ccs.isEmpty()) {
            sql += " OR prise_type_combo_ccs = ?";
        }
        if (accessibilite_pmr != null && !accessibilite_pmr.isEmpty()) {
            sql += " OR accessibilite_pmr = ?";
        }
        if (reservation != null && !reservation.isEmpty()) {
            sql += " OR reservation = ?";
        }
        if (gratuit != null && !gratuit.isEmpty()) {
            sql += " OR gratuit = ?";
        }
        if (paiement_cb != null && !paiement_cb.isEmpty()) {
            sql += " OR paiement_cb = ?";
        }
        if (paiement_acte != null && !paiement_acte.isEmpty()) {
            sql += " OR paiement_acte = ?";
        }
        if (paiement_autre != null && !paiement_autre.isEmpty()) {
            sql += " OR paiement_autre = ?";
        }
        try (PreparedStatement pstmt = connection.prepareStatement(
                sql + " ORDER BY SQRT(POWER(consolidated_latitude - ?, 2) + POWER(consolidated_longitude - ?, 2)) LIMIT 30")) {
            int paramIndex = 0;
            if (prise_type_2 != null && !prise_type_2.isEmpty()) {
                paramIndex += 1;
                pstmt.setBoolean(paramIndex, prise_type_2.equals("on"));
            }
            if (prise_type_ef != null && !prise_type_ef.isEmpty()) {
                paramIndex += 1;
                pstmt.setBoolean(paramIndex, prise_type_ef.equals("on"));
            }
            if (prise_type_chademo != null && !prise_type_chademo.isEmpty()) {
                paramIndex += 1;
                pstmt.setBoolean(paramIndex, prise_type_chademo.equals("on"));
            }
            if (prise_type_autre != null && !prise_type_autre.isEmpty()) {
                paramIndex += 1;
                pstmt.setBoolean(paramIndex, prise_type_autre.equals("on"));
            }
            if (prise_type_combo_ccs != null && !prise_type_combo_ccs.isEmpty()) {
                paramIndex += 1;
                pstmt.setBoolean(paramIndex, prise_type_combo_ccs.equals("on"));
            }
            if (accessibilite_pmr != null && !accessibilite_pmr.isEmpty()) {
                paramIndex += 1;
                pstmt.setBoolean(paramIndex, accessibilite_pmr.equals("on"));
            }
            if (reservation != null && !reservation.isEmpty()) {
                paramIndex += 1;
                pstmt.setBoolean(paramIndex, reservation.equals("on"));
            }
            if (gratuit != null && !gratuit.isEmpty()) {
                paramIndex += 1;
                pstmt.setBoolean(paramIndex, gratuit.equals("on"));
            }
            if (paiement_cb != null && !paiement_cb.isEmpty()) {
                paramIndex += 1;
                pstmt.setBoolean(paramIndex, paiement_cb.equals("on"));
            }
            if (paiement_acte != null && !paiement_acte.isEmpty()) {
                paramIndex += 1;
                pstmt.setBoolean(paramIndex, paiement_acte.equals("on"));
            }
            if (paiement_autre != null && !paiement_autre.isEmpty()) {
                paramIndex += 1;
                pstmt.setBoolean(paramIndex, paiement_autre.equals("on"));
            }
            pstmt.setDouble(paramIndex+1, latitude);
            pstmt.setDouble(paramIndex+2, longitude);

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