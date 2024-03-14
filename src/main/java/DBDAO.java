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
        String url = "jdbc:mysql://" + BASE_URL + ":3306/bornes_electriques";
        String username = "administrator";
        String password = "root";

        connection = DriverManager.getConnection(url, username, password);
    }
}