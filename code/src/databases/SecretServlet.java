package databases;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SecretServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public SecretServlet() {
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	private boolean checkUserValid(String userName, String secret, String answer) {
		Connection c = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager
					.getConnection("jdbc:postgresql://localhost:5432/SVM",
							"postgres", "cs422");
			System.out.println("Opened Database successfully");
			stmt = c.createStatement();
			rs = stmt
					.executeQuery("select * from public.\"Login\" where username='"
							+ userName
							+ "' and secret = '"
							+ secret
							+ "' and answer ='" + answer + "';");
			int counter = 0;
			while (rs.next()) {
				counter++;
			}

			if (counter > 0) {
				return true;
			}
			return false;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		} finally {

			if (rs != null) {
				try {

					rs.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

			if (stmt != null) {
				try {

					stmt.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

			if (c != null) {
				try {

					c.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String secret = request.getParameter("secret");
		String answer = request.getParameter("answer");
		if (!userName.equalsIgnoreCase("") && (!answer.equalsIgnoreCase(""))) {
			boolean validUser = checkUserValid(userName, secret, answer);
			if (validUser) {
				request.getSession().setAttribute("userName", userName);
				response.sendRedirect("UpdatePassword.jsp");
			} else {
				response.sendRedirect("InvalidSecret.jsp");
			}
		} else {
			response.sendRedirect("InvalidSecret.jsp");
		}

	}

}
