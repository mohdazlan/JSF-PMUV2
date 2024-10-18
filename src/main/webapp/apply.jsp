<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<%
String staffFullName = request.getParameter("staffFullName");
String staffID = request.getParameter("staffID");

if (staffFullName != null && staffID != null) {
	Class.forName("net.sourceforge.jtds.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:jtds:sqlserver://localhost:1433/jsf-pmu", "sa", "p@ssw0rd");
	String query = "INSERT INTO SportRoomBooking(StaffFullName,StaffID) VALUES (?,?)";
	PreparedStatement ps = conn.prepareStatement(query);
	ps.setString(1, staffFullName);
	ps.setInt(2, Integer.parseInt(staffID));
	ps.executeUpdate();
	ps.close();
	conn.close();
	out.println("<p>Booking successful!</p>");
}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="apply.jsp" method="post">


		<label for="people">Full Name</label> <input type="text" id="people"
			name="staffFullName"> <br>
		<br> <label for="staff">Staff ID:</label> <input type="number"
			id="staff" name="staffID"> <br>
		<br> <input type="submit" value="Book Facility">
	</form>
</body>
</html>