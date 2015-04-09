package databases;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private void updateRecord(String username, String selectedStock) {
		try {

			Connection c = ConnectionManager.getConnection();
			Statement stmt = c.createStatement();
			String query = "";
			query = "insert into public.\"SearchStockData\" (username, stocksymbol) values('"
					+ username + "','" + selectedStock + "')";
			System.out.println("Query String: " + query);
			stmt.executeUpdate(query.toString());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String selectedStock = request.getParameter("StockSymbol").toString();
		String username = request.getSession().getAttribute("theName")
				.toString();
		try {
			updateRecord(username, selectedStock);
			response.sendRedirect("Search.jsp");
		} catch (Exception ex) {
			response.sendRedirect("Error.jsp");
		}
	}
}
