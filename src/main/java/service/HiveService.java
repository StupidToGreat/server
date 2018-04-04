package service;

import org.springframework.stereotype.Service;
import java.sql.*;

@Service
public class HiveService {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER
            = "org.apache.hive.jdbc.HiveDriver";
    static final String DB_URL = "jdbc:hive2://70.12.111.22:10000";

    // Database credentials
    static final String USER = "hadoop";
    static final String PASS = "bigdata";

//    public static void main(String[] args) {
//
//    }
    public void hiveConnect() {
        Connection conn = null;
        Statement stmt = null;
        try {
            // STEP 2: Register JDBC driver
            Class.forName(JDBC_DRIVER);

            // STEP 3: Open a connection
            DriverManager.setLoginTimeout(30000);
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            stmt.setQueryTimeout(5000);
            String sql;
            sql = "SELECT * FROM dept";
            ResultSet rs = stmt.executeQuery(sql);

            // STEP 5: Extract data from result set
            while (rs.next()) {
                // Retrieve by column name
                int deptno = rs.getInt(1);
                // Display values
                System.out.print("DEPTNO : " + deptno);
            }
            // STEP 6: Clean-up environment
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            // Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
            }
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        System.out.println("Goodbye!");
    }
}
