<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Create New User</title>
	<link rel="stylesheet" href="../css/style.css">
 	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script> 
</head>
<body>

	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
	<h2 class="pageheading"> 
		<c:if test="${user != null}">
			Edit User
		</c:if>
		<c:if test="${user == null}">
			Create New User
		</c:if>
	</h2>
	<br/><br>
	</div>
	
	<div align="center">
	<c:if test="${user != null}">
			<form action="update_user" method="post" id="userForm" ></form>
			<input type="hidden" name="userId" value="${user.userId}">
		</c:if>
		<c:if test="${user == null}">
			<form action="create_user" method="post" id="userForm" ></form>
			</c:if>
		
	<table class=form>
		<tr>
			<td>Email:</td>
			<td><input type="text" name="email" id="email" size="20" value="${user.email}"/></td>
		</tr>
		<tr>
			<td>Full Name:</td>
			<td><input type="text" name="fullname" id="fullname" size="20"value="${user.fullName}" /></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="password" id="password" size="20"value="${user.password}" /></td>
		</tr>
		<tr><td> &nbsp; </td></tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">Save</button>&nbsp;&nbsp;
				<button onClick="javascript:history.go(-1)">Cancel</button>
			</td>
		</tr>
	</table>
	
	</div>
	 
	<jsp:directive.include file="footer.jsp"/>

</body>
<script type="text/javascript">

	$(document).ready(function(){
		$("#userForm").validate({
			rules:{
				email:"required",
				fullname:"required",
				password:"required",
			},
			messages:{
				email:"Email required!",
				fullname: "Full Name is reuired!",
				password: "Password is required"
			}
		});
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
	
	
	function validateFormInput(){
		
		var fieldEmail = document.getElementById("email");
		var fieldFullname = document.getElementById("fullname");
		var fieldPassword = document.getElementById("password");
				
		if(fieldEmail.value.length == 0){
			alert("Email is required!!!");
			fieldEmail.focus();
			return false;
		}
		if(fieldFullname.value.length == 0){
			alert("Fullname is required!!!");
			fieldFullname.focus();
			return false;
		}
		if(fieldPassword.value.length == 0){
			alert("Password is required!!!");
			fieldPassword.focus();
			return false;
		}
			return true;
	}
</script>
</html>