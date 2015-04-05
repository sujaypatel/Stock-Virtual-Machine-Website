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

	private boolean checkUserValid(String userName, String email) {
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
							+ userName + "' and email ='" + email + "';");
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
			if (c != null) {
				try {
					rs.close();
					stmt.close();
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
		String email = request.getParameter("email");
		if (!userName.equalsIgnoreCase("")) {
			boolean validUser = checkUserValid(userName, email);
			if (validUser) {
				request.getSession().setAttribute("userName", userName);
				request.getSession().setAttribute("email", email);
				response.sendRedirect("RetrievePassword.jsp");
			} else {
				response.sendRedirect("InvalidSecret.jsp");
			}
		} else {
			response.sendRedirect("InvalidSecret.jsp");
		}

	}

}
