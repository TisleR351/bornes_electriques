package dao;

import classes.Borne;
import io.github.cdimascio.dotenv.Dotenv;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBDAO {
    private Connection connection;

    public DBDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("Cannot find the driver in the classpath!", e);
        }
    }

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
    public List<Borne> getCloseElectricTerminals(double userLatitude, double userLongitude) throws SQLException {
        dbConnect();
        Dotenv dotenv = Dotenv.load();
        List<Borne> bornes = new ArrayList<>();
        String tableName = dotenv.get("TABLE_NAME");
        try (
                PreparedStatement pstmt = connection.prepareStatement(
                "SELECT *, " +
                        "6371 * 2 * ASIN(SQRT(POWER(SIN((? - ABS(consolidated_latitude)) * PI()/180 / 2), 2) + " +
                        "COS(? * PI()/180 ) * COS(ABS(consolidated_latitude) * PI()/180) * " +
                        "POWER(SIN((? - consolidated_longitude) * PI()/180 / 2), 2) )) AS distance " +
                        "FROM " + tableName + " " +
                        "ORDER BY distance LIMIT 15")) {
            pstmt.setDouble(1, userLatitude);
            pstmt.setDouble(2, userLatitude);
            pstmt.setDouble(3, userLongitude);


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
        return bornes;
    }

}