<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Write Review Page</title>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>	
</head>
<body>

	<jsp:directive.include file="header.jsp"/>

	<div align="center">
		<form>
			<table class="normal" width="60%">
			<tr>
				<td><h2>Your Reviews</h2></td>
				<td> &nbsp; </td>
				<td>${loggedCustomer.fullName}</td>
			</tr>
			<tr>
			<td colspan="3"><hr/></td>
			</tr>
			<tr>
			<td>
					<img class="book-large" src="data:image/jpg;base64,${book.base64Image}"/>
				</td>
			</tr>
			</table>
		</form>
	</div>
	
	<jsp:directive.include file="footer.jsp"/>

</body>
<script type="text/javascript">

	$(document).ready(function(){
		$("#loginForm").validate({
			rules:{
				email:{required:true,
					   email:true,
			},
				password:"required",
			},
			messages:{
				email:{
				required:"Email is required!",
				email:"Please enter a valid email"
				},
				password: "Password is required"
				
			}
		});
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
	</script>
</html>