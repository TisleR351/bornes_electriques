import io.github.cdimascio.dotenv.Dotenv;

import java.nio.file.Paths;
import java.sql.*;

public class DBDAO {
    private final String BASE_URL = "172.17.0.2";
    private Connection connection;

    public DBDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            dbConnect();
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("Cannot find the driver in the classpath!", e);
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
}