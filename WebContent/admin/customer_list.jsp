<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bookstore Customer Management Page</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
	<div>
	<h2 class="pageheading"> Customer Management Dashboard</h2>
	<h3> <a href="new_customer">Create New Customer</a> </h3>
	
	<br/><br>
	</div>
	
	
	<c:if test="${message != null}">
	<div align="center">
	<h4 class="message">${message}</h4>
	</div>
	</c:if>

	<div align="center">
		<table border="1" cellpadding="5">
			<tr>
			<th>Index</th>
			<th>ID</th>
			<th>E-mail</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>City</th>
			<th>Country</th>
			<th>Registered Date</th>
			<th>Actions</th>
			
			</tr>
			<c:forEach var="customer" items="${listCustomer}" varStatus="status">
			<tr>
				<td>${status.index+1}</td>
				<td>${customer.customerId}</td>
				<td>${customer.email}</td>
				<td>${customer.firstName}</td>
				<td>${customer.lastName}</td>
				<td>${customer.city}</td>
				<td>${customer.countryName}</td>
				<td>${customer.registerDate}</td>
				
				<td> 
					<a href="edit_customer?id=${customer.customerId}">Edit</a> &nbsp;
					<a href="javascript:void(0);" class="deleteLink" id="${customer.customerId}">Delete</a>
		
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>

	
	</div>
	<jsp:directive.include file="footer.jsp"/>
</body>

	<script>
	$(document).ready(function(){
		$(".deleteLink").each(function(){
			$(this).on("click",function(){
				customerId= $(this).attr("id");
				if(confirm("Are You Sure you want to delete customer with  ID: "+customerId+"?")){
					window.location = 'delete_customer?id=' +customerId;
				}
			});
		});
	});
	
	</script>
</html>