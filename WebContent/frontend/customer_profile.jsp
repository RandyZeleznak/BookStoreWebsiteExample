<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Profile Page</title>
	<link rel="stylesheet" href="css/style.css" >
</head>
<body>

	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
	<h2> Welcome, ${loggedCustomer.fullName} </h2>
	<br/>
	<table class="customer">
	<tr>
		<td><b> E-Mail Address:  </b></td>
		<td>${loggedCustomer.email}</td>
	</tr>
	<tr>
		<td><b>Full Name: </b></td>
		<td>${loggedCustomer.fullName }
	</tr>
	<tr>
		<td><b> Phone Number:  </b></td>
		<td>${loggedCustomer.phone}</td>
	</tr>
	<tr>
		<td><b>Address: </b></td>
		<td>${loggedCustomer.address }
	</tr>
	<tr>
		<td><b>City: </b></td>
		<td>${loggedCustomer.city }
	</tr>
	<tr>
		<td><b>Country: </b></td>
		<td>${loggedCustomer.country }
	</tr>
	<tr>
		<td><b> Zip Code:  </b></td>
		<td>${loggedCustomer.zipcode}</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><b></b><a href="edit_profile">Edit Profile</a></td>
	</tr>
	
	</table>
	</div>
	
	
	
	<jsp:directive.include file="footer.jsp"/>
	
</body>
</html>