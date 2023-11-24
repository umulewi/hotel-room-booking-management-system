
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connection {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/project";
        String dbUser = "root";
        String dbPassword = "";
        
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        
        // Establish database connection
        Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        
        return conn;
    }
}
