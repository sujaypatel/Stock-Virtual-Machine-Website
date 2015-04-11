<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.concurrent.ConcurrentHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.SymbolData"%>
<%@page import="model.StockDataFetcher"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
<title>Search Stock Page</title>
<%!HashMap<String, String> userPortfolios = new HashMap<String, String>();
	ArrayList<String> userStockSymbols = new ArrayList<String>();
	HashMap<String, SymbolData> completePortfolioData = new HashMap<String, SymbolData>();

	//HashMap<String, String> stockQuanity = new HashMap<String, String>();

	private ArrayList<String> getStockSymbolsForUser(String username) {
		ArrayList<String> symbols = new ArrayList<String>();
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
					.executeQuery("select * from public.\"SearchStockData\" where username='"
							+ username + "';");
			int counter = 0;
			while (rs.next()) {

				symbols.add(rs.getString(2));
				//stockQuanity.put(rs.getString(2), rs.getString(3));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
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
		return symbols;
	}

	private HashMap<String, String> getPortfolioForUser(String user) {
		HashMap<String, String> folios = new HashMap<String, String>();
		// Do Database Connection
		ArrayList<String> symbols = getStockSymbolsForUser(user);
		if (symbols.isEmpty()) {
			System.out.println("*** No STocks for the user");
			return new HashMap<String, String>();
		}
		for (int i = 0; i < symbols.size(); i++) {
			StockDataFetcher fetcher = new StockDataFetcher();
			System.out.println("*** symbols: " + symbols.get(i));
			HashMap<String, String> retVal = fetcher
					.getStockDataForFiveYears(symbols.get(i));
			Iterator it = retVal.entrySet().iterator();
			String val = "";
			while (it.hasNext()) {
				Map.Entry stockData = (Map.Entry) it.next();

				String[] stockValues = stockData.getValue().toString()
						.split(",");

				SymbolData data = new SymbolData();
				data.setOpen(stockValues[0]);
				data.setHigh(stockValues[1]);
				data.setLow(stockValues[2]);
				data.setClose(stockValues[3]);
				data.setVolume(stockValues[4]);
				data.setAdjClose(stockValues[5]);

				val = val + stockValues[5] + ",";
				completePortfolioData.put(symbols.get(i), data);
			}
			val = val.substring(0, val.length() - 2);
			//System.out.println("*** Val: " + val);
			folios.put(symbols.get(i), val);
		}
		return folios;
	}%>

<%
	userPortfolios.clear();
	userStockSymbols.clear();
	if (session.getAttribute("theName") == null) {

		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/Login.jsp");
		dispatcher.forward(request, response);
		System.out.println("***theName == NULL");
	} 
	if (request.getSession().getAttribute("theName") != null) {
		userPortfolios = getPortfolioForUser(request.getSession()
				.getAttribute("theName").toString());
		if (userPortfolios.isEmpty()) {

		} else {
			Iterator it = userPortfolios.entrySet().iterator();
			Map.Entry pairs;
			int countX = 0;
			userStockSymbols.clear();
			while (it.hasNext()) {
				if (countX < 5) {
					pairs = (Map.Entry) it.next();
					StringBuilder cookieVal = new StringBuilder();
					String[] store = pairs.getValue().toString()
							.split(",");
					for (int i = 0; i < 7; i++) {
						cookieVal.append(store[i]).append(",");
					}
					Cookie ck = new Cookie(pairs.getKey().toString(),
							cookieVal.toString());
					response.addCookie(ck);
					userStockSymbols.add(pairs.getKey().toString());
					countX++;
				}
			}
			int count = 0;
		}
	}
%>
</head>
<body>
	<div class="navbar navbar-default">
		<a class="home" href="Home.jsp">Stock Virtual Machine</a> <a
			class="backtoPortfolio" href="Portfolio.jsp"> Back To Portfolio </a>
		<a class="backtoPortfolio" href="LogoutServlet"> Logout </a>
	</div>
	<center>
		<h1>Search Stocks</h1>

		<form ACTION="SearchServlet" method="post">

			<h4>
				Select a Company: <select id="StockSymbol" name="StockSymbol">
					<%
						Connection c = null;
						Statement stmt = null;
						ResultSet rs = null;
						try {
							String userId = session.getAttribute("theName").toString();
							System.out.println("*** username: " + userId);
							Class.forName("org.postgresql.Driver");
							c = DriverManager.getConnection(
									"jdbc:postgresql://localhost:5432/SVM", "postgres",
									"cs422");
							System.out.println("Opened Database successfully");
							stmt = c.createStatement();
							String query = "select s.cname,s.symbol from public.\"Stock\" s";
							rs = stmt.executeQuery(query);
							while (rs.next()) {
					%>
					<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
					<%
						}
						} catch (Exception ex) {
							ex.printStackTrace();
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
					%>
				</select>
			</h4>

			<div id="move_right">
				<TABLE class="table table-bordered table-striped">
					<TR>
						<TH COLSPAN="5" style="text-shadow: black;">List of Search
							Stocks</TH>
					</TR>
					<TR style="background-color: black; color: white;">
						<TH align="center">Symbol</TH>
						<TH align="center">High</TH>
						<TH align="center">Low
						<TH align="center">Close</TH>
					</TR>
					<%
						Iterator it1 = userPortfolios.entrySet().iterator();
						System.out.println("*** Before While : " + userStockSymbols);
						System.out.println("*** Before While : " + userStockSymbols.size());
						if (userStockSymbols.size() == 5) {
							try {
								String userId = session.getAttribute("theName").toString();
								System.out.println("*** username: " + userId);
								Class.forName("org.postgresql.Driver");
								c = DriverManager.getConnection(
										"jdbc:postgresql://localhost:5432/SVM", "postgres",
										"cs422");
								System.out.println("Opened Database successfully");
								stmt = c.createStatement();
								String query = ("DELETE FROM public.\"SearchStockData\" where username='"
										+ userId + "';");
								stmt.executeQuery(query);
							} catch (Exception ex) {
								ex.printStackTrace();
							}
						}
						for (int i = 0; i < userStockSymbols.size(); i++) {
							out.println("<tr align=\"center\"><td style=\"background-color: #6776AE;\">"
									+ "<font color=\"white\">"
									+ userStockSymbols.get(i)
									+ "</font></td>");
							SymbolData data = completePortfolioData.get(userStockSymbols
									.get(i));
							out.println("<td style = \"background-color: #6776AE;\">"
									+ "<font color=\"white\">" + data.getHigh()
									+ "</font></td>");
							out.println("<td style = \"background-color: #6776AE;\">"
									+ "<font color=\"white\">" + data.getLow()
									+ "</font></td>");
							out.println("<td style = \"background-color: #6776AE;\">"
									+ "<font color=\"white\">" + data.getClose()
									+ "</font></td>");

							out.println("</tr>");
						}
						System.out.println("***After While : " + userStockSymbols);
					%>
				</TABLE>

				<input id="Buy" class="btn btn-success" type="submit" value="SEARCH">
				<br> <img src="images/Buy.jpg" height="200" width="200"
					HSPACE=10>
			</div>
		</form>
		<%
			String errorMsg = "";
			if (session.getAttribute("stockError") != null) {
				errorMsg = session.getAttribute("stockError").toString();
		%>
		<div align="center">
			<label style="color: red;"><font size="5"><%=errorMsg%></font></label>
		</div>
		<%
			}
		%>
	</center>
	<br>
	<div class="navbar navbar-default">
		<center>
			<div class="copyright">Copyright &copy; 2015 &middot; All
				Rights Reserved &middot;</div>
		</center>
	</div>
</body>
</html>