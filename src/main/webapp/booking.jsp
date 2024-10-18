<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<%
Class.forName("net.sourceforge.jtds.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:jtds:sqlserver://localhost:1433/jsf-pmu", "sa", "p@ssw0rd");
String query = "SELECT * FROM SportRoomBooking";
PreparedStatement ps = conn.prepareStatement(query);

ResultSet rs = null;
rs = ps.executeQuery();
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<%
		while (rs.next()) {
			String fName = rs.getString("StaffFullName");
			String sID = rs.getString("StaffID");
		%>

		<tr>
			<td><%=fName%></td>
			<td><%=sID%></td>
		</tr>
		
		<%
		}
		%>
	</table>
</body>
</html>