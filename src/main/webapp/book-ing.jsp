<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<%
    // Load JDBC driver
    Class.forName("net.sourceforge.jtds.jdbc.Driver");

    // Establish connection to the database
    Connection conn = DriverManager.getConnection("jdbc:jtds:sqlserver://localhost:1433/jsf-pmu", "sa", "p@ssw0rd");

    // Delete operation
    String deleteStaffID = request.getParameter("deleteStaffID");
    if (deleteStaffID != null) {
        String deleteQuery = "DELETE FROM SportRoomBooking WHERE StaffID = ?";
        PreparedStatement psDelete = conn.prepareStatement(deleteQuery);
        psDelete.setInt(1, Integer.parseInt(deleteStaffID));
        psDelete.executeUpdate();
        psDelete.close();
    }

    // SQL query to select data from SportRoomBooking
    String selectQuery = "SELECT StaffFullName, StaffID FROM SportRoomBooking";
    PreparedStatement psSelect = conn.prepareStatement(selectQuery);

    // Execute the query
    ResultSet rs = psSelect.executeQuery();
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Sport Room Bookings</title>
</head>
<body>
    <h2>Sport Room Bookings</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Staff Full Name</th>
                <th>Staff ID</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
        // Loop through the result set and display data
        while (rs.next()) {
            String fName = rs.getString("StaffFullName");
            String sID = rs.getString("StaffID");
        %>
            <tr>
                <td><%= fName %></td>
                <td><%= sID %></td>
                <td>
                    <!-- Delete Button -->
                    <form method="post" action="viewSportRoomBookings.jsp" style="display:inline;">
                        <input type="hidden" name="deleteStaffID" value="<%= sID %>">
                        <button type="submit">Delete</button>
                    </form>
                    <!-- Edit Button -->
                    <form method="get" action="editSportRoomBooking.jsp" style="display:inline;">
                        <input type="hidden" name="editStaffID" value="<%= sID %>">
                        <button type="submit">Edit</button>
                    </form>
                </td>
            </tr>
        <%
        }
        %>
        </tbody>
    </table>

    <%
    // Close the ResultSet and PreparedStatement
    rs.close();
    psSelect.close();
    
    // Close the connection
    conn.close();
    %>
</body>
</html>
