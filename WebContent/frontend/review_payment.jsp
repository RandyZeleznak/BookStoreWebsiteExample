<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Review Payment - Online Bookstore </title>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>	
</head>
<body>

	<jsp:directive.include file="header.jsp"/>

	<div align="center">
	<h3><i> Please carefully review the following information before making payment</h3>
	<h2> Payer Information</h2>
	<table>
	<tr>
		<td><b>First Name:</b></td>
		<td>${payer.firstName}</td>
	</tr>
	<tr>
		<td><b>Last Name:</b></td> 
		<td>${payer.lastName}</td>		
	</tr>
	<tr>
		<td><b>E-mail :</b></td> 
		<td>${payer.email}</td>		
	</tr>
	
	
	</table>
	
	</div>

</body>
</html>