<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="loginServlet" method="post">
		<label>User Name</label><input type="text" name="txtname"> <br>
		<label>Password</label><input type="text" name="txtpassword">
		<button type="submit">Submit</button>
	</form>
</body>
</html>