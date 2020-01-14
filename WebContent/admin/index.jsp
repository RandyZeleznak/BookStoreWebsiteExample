<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Users - Bookstore Administration Page</title>
	<link rel="stylesheet" href="../css/style.css">	
</head>

<body>

	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
	<div>
	<h2 class="pageheading"> User Management</h2>
	<br/><br>
	</div>
	
	<div align="center">
	<hr width="60%">
		<h2>Quick Actions</h2>
		<a href="create_book">New Book</a> &nbsp
		<a href="create_user">New User</a> &nbsp
		<a href="create_category">New Category</a> &nbsp
		<a href="create_user">New User</a> &nbsp
	</div>
	<hr width="60%">
	<div align="center">
		<h2 class="pageheading"> Recent Sales:</h2>
	</div>
	<div align="center">
	<hr width="60%">
		<h2 class="pageheading"> Recent Reviews:</h2>
	</div>
	<div align="center">
	<hr width="60%">
		<h2 class="pageheading"> Statistics:</h2>
	</div>
		
	</div>
	<jsp:directive.include file="footer.jsp"/>
</body>
</html>