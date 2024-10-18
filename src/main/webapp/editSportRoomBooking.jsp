<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<%
    // Load JDBC driver
    Class.forName("net.sourceforge.jtds.jdbc.Driver");
    Connection conn = null;

    String editStaffID = request.getParameter("editStaffID"); // Declare and get the editStaffID from request
    String fName = ""; // Variable to hold the staff full name

    try {
        // Establish connection to the database
        conn = DriverManager.getConnection("jdbc:jtds:sqlserver://localhost:1433/jsf-pmu", "sa", "p@ssw0rd");

        if (editStaffID != null) {
            // Fetch existing data for the selected booking
            String selectQuery = "SELECT StaffFullName FROM SportRoomBooking WHERE StaffID = ?";
            PreparedStatement psSelect = conn.prepareStatement(selectQuery);
            psSelect.setString(1, editStaffID); // Use setString since StaffID is VARCHAR
            ResultSet rs = psSelect.executeQuery();

            if (rs.next()) {
                fName = rs.getString("StaffFullName"); // Get the current staff full name
            }
            rs.close();
            psSelect.close();
        }

        // Update the record when the form is submitted
        if (request.getParameter("update") != null) {
            String newFullName = request.getParameter("StaffFullName");

            // Update query to modify the staff full name
            String updateQuery = "UPDATE SportRoomBooking SET StaffFullName = ? WHERE StaffID = ?";
            PreparedStatement psUpdate = conn.prepareStatement(updateQuery);
            psUpdate.setString(1, newFullName); // Set the new full name
            psUpdate.setString(2, editStaffID);  // Use the staff ID for the WHERE clause
            int rowsAffected = psUpdate.executeUpdate(); // Execute the update
            psUpdate.close(); // Close the PreparedStatement

            // Optional: Debugging output for how many rows were updated
            out.println(rowsAffected + " record(s) updated."); 
            response.sendRedirect("book-ing.jsp"); // Redirect back to the main page after updating
        }
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage()); // Print any SQL errors
    } finally {
        // Close the connection if it's not null
        if (conn != null) {
            conn.close();
        }
    }
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Sport Room Booking</title>
</head>
<body>
    <h2>Edit Booking for Staff ID: <%= editStaffID %></h2> <!-- Use editStaffID here -->
    <form method="post" action="editSportRoomBooking.jsp"> <!-- Ensure the action is correct -->
        <input type="hidden" name="editStaffID" value="<%= editStaffID %>"> <!-- Keep the Staff ID hidden -->
        <label for="StaffFullName">Staff Full Name:</label>
        <input type="text" name="StaffFullName" value="<%= fName %>" required> <!-- Pre-fill with current full name -->
        <button type="submit" name="update">Update</button> <!-- Submit button to update the record -->
    </form>
</body>
</html>
