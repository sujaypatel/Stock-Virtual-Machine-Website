package databases;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	private boolean isUserExists(String userName) {
		Connection c = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			c = ConnectionManager.getConnection();
			System.out
					.println("Opened Database successfully - RegisterServlet");
			stmt = c.createStatement();
			String query = "select * from public.\"Login\" where username='"
					+ userName + "'";
			rs = stmt.executeQuery(query);
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

	private boolean createNewUser(String userName, String password,
			String email, String secret, String answer, String firstname,
			String lastname) {
		Connection c = null;
		Statement stmt = null;

		try {
			// connect to DB
			c = ConnectionManager.getConnection();
			System.out.println("Opened Database successfully");
			stmt = c.createStatement();
			StringBuilder queryString = new StringBuilder(
					"insert into public.\"Login\" (username,password,email,virtualbalance, secret, answer, firstname, lastname) values ('"
							+ userName
							+ "','"
							+ password
							+ "','"
							+ email
							+ "','"
							+ 1000
							+ "','"
							+ secret
							+ "','"
							+ answer
							+ "','" + firstname + "','" + lastname + "')");
			System.out.println("Query String: " + queryString);

			int result = stmt.executeUpdate(queryString.toString());
			if (result != 0) {
				return true;
			}
			return false;

		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		} finally {
			if (c != null) {
				try {
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

		String email = request.getParameter("email");
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String secret = request.getParameter("secret");
		String answer = request.getParameter("answer");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");

		if (password.equals(confirmPassword)) {
			if (!isUserExists(userName)) {
				boolean success = createNewUser(userName, password, email,
						secret, answer, firstname, lastname);
				if (success) {
					HttpSession session = request.getSession(true);
					session.setAttribute("theName", userName);
					response.sendRedirect("Portfolio.jsp");
					request.getSession().removeAttribute("reg_error");
				}
			} else {
				request.getSession().setAttribute("reg_error", "1");
				response.sendRedirect("Register.jsp");
			}
		} else {
			request.getSession().setAttribute("reg_error", "2");
			response.sendRedirect("Register.jsp");
		}

	}
}
