package databases;

import java.sql.*;

public class ConnectionManager {

	static Connection con;
	static String url;

	public static Connection getConnection() {
		try {
			Class.forName("org.postgresql.Driver");
			try {
				con = DriverManager.getConnection(
						"jdbc:postgresql://localhost:5432/SVM", "postgres",
						"cs422");
				if(con != null)
				   System.out.print("Hello");
			}
			catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		catch (ClassNotFoundException e) {
			System.out.println(e);
		}
		return con;
	}
}
