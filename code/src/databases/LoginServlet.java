package databases;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public boolean isUserValid(String userName, String password) {
		Connection c = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			c = ConnectionManager.getConnection();
			System.out.println("Opened Database successfully");
			stmt = c.createStatement();
			rs = stmt
					.executeQuery("select * from public.\"Login\" where username='"
							+ userName + "' and password = '" + password + "';");
			while (rs.next()) {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		try {
			String userName = request.getParameter("un");
			String password = request.getParameter("pw");
			boolean validUser = isUserValid(userName, password);
			if (validUser) {
				HttpSession session = request.getSession(true);
				session.setAttribute( "theName", userName );
				response.sendRedirect("Portfolio.jsp"); // logged-in page
			} else
				response.sendRedirect("LoginInvalid.jsp"); // error page
		} catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}
