<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Create New Customer</title>
	<link rel="stylesheet" href="../css/style.css" >
	<link rel="stylesheet" href="../css/jquery-ui.min.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	
	<div align="center">
		<h2 class="pageheading">
			<c:if test="${customer != null}">
				Edit Customer
			</c:if>
			<c:if test="${customer == null}">
				Create New Customer
			</c:if>
		</h2>
	</div>
	
	<div align="center">
		<c:if test="${customer != null}">
			<form action="update_customer" method="post" id="customerForm" >
			<input type="hidden" name="customerId" value="${customer.customerId}">
		</c:if>
		<c:if test="${customer == null}">
			<form action="create_customer" method="post" id="customerForm" >
		</c:if>
		
		<table class="form">
			
			<tr>
				<td align="right">E-Mail:</td>
				<td align="left"><input type="text" id="email" name="email" size="20" value="${customer.email}" /></td>
			</tr>
			<tr>
				<td align="right">First Name:</td>
				<td align="left"><input type="text" id="firstName" name="firstName" size="30" value="${customer.firstName}" /></td>
			</tr>
			<tr>
				<td align="right">Last Name:</td>
				<td align="left"><input type="text" id="lastName" name="lastName" size="30" value="${customer.lastName}" /></td>
			</tr>
			<tr>
				<td align="right">Password :</td>
				<td align="left"><input type="password" id="password" name="password" size="20" value="${customer.password}" /></td>
			</tr>
			<tr>
				<td align="right">Confirm Password :</td>
				<td align="left"><input type="password" id="confirmPassword" name="confirmPassword" size="20" value="${customer.password}" /></td>
			</tr>
			<tr>
				<td align="right">Phone:</td>
				<td align="left"><input type="text" id="phone" name="phone" size="15" value="${customer.phone}" /></td>
			</tr>
			<tr>
				<td align="right">Address Line 1:</td>
				<td align="left"><input type="text" id="addressLine1" name="addressLine1" size="30" value="${customer.addressLine1}"/></td>
			</tr>
			<tr>
				<td align="right">Address Line 2:</td>
				<td align="left"><input type="text" id="addressLine2" name="addressLIne2" size="30" value="${customer.addressLine2}"/></td>
			</tr>
			<tr>
				<td align="right">City:</td>
				<td align="left"><input type="text" id="city" name="city" size="20" value="${customer.city}"/></td>
			</tr>
			<tr>
				<td align="right">State:</td>
				<td align="left"><input type="text" id="state" name="state" size="20" value="${customer.state}"/></td>
			</tr>
			<tr>
				<td align="right">Zip Code:</td>
				<td align="left"><input type="text" id="zipcode" name="zipcode" size="10" value="${customer.zipcode}"/></td>
			</tr>
			<tr>
				<td align="right">Country:</td>
				<td align="left">
					<select name="country" id="country">
					<c:forEach items="${mapCountries}" var="country">
						<option value="${country.value}">${country.key}</option>
					</c:forEach>
					</select>
			</tr>
			
				
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">Save</button>&nbsp;&nbsp;&nbsp;
					<button id="buttonCancel">Cancel</button>
				</td>
			</tr>				
		</table>
		</form>
	</div>

	<jsp:directive.include file="footer.jsp" />
</body>
<script type="text/javascript">

	$(document).ready(function() {
		
		$("#customerForm").validate({
			rules: {
				email:{
					required: true,
					email: true
				},
				firstName: "required",
				lastName: "required",
				password: "required",
				confirmPassword: {
					required: true,
					equalTo: "#password"
				},
				phone: "required",
				addressLine1: "required",
				city:"required",
				state:"required",
				zipcode: "required",
				country:"required",
			},
			
			messages: {

				email:{
					required: "Please enter an e-mail address",
					email: "Please enter a valid e-mail address"
					},
				firstName: "Please enter First Name",
				lastName: "Please enter Last Name",
				password: "Please confirm Password",
				confirmPassword: {
					required: "Please enter Password",
					equalTo: "Confirm password does not math password"
				},
				phone: "Please enter phone number ",
				addressLine1: "please enter street address",
				city:"please enter city",
				state:"please enter state or province",
				zipcode: "please enter zipcode",
				country:"please enter country",
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
	
	function showImageThumbnail(fileInput){
		var file = fileInput.files[0];
		
		var reader = new FileReader();
		
		reader.onload = function(e){
			$('#thumbnail').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	}
	
</script>
</html>