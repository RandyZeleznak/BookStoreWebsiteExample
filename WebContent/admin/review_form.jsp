<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit Review</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
	<h2 class="pageheading"> Edit Review	</h2>
	<br/><br>
	</div>
	
	<div align="center">
			<form action="update_review" method="post" id="reviewForm">
			<input type="hidden" name="reviewId" value="${review.reviewId}">
		
		
	<table class="form">
		<tr>
			<td align="right">Book:</td>
			<td align="left"><b>${review.book.title}</b>
		</tr>
		<tr>
			<td align="right">Rating:</td>
			<td align="left"><b>${review.rating}</b>
		</tr>
		<tr>
			<td align="right">Customer:</td>
			<td align="left"><b>${review.customer.fullName}</b>
		</tr>
		<tr>
			<td align="right">Headline: </td>
			<td align="left">
				<input type="text" size="60" name="headline" value="${review.headline}" />
			</td>
		</tr>
		<tr>
			<td align="right">Comment: </td>
			<td align="left">
				<input type="text" size="60" name="comment" value="${review.comment}" />
			</td>
		</tr>
		
		<tr><td> &nbsp; </td></tr>
		<tr>
			<td colspan="2" align="center">
				<button onclick="review_list.jsp">Submit</button>&nbsp;&nbsp;
				<input type="button" id="buttonCancel" value="Cancel" />
			</td>
		</tr>
	</table>
	</form>
	</div>
	
	<jsp:directive.include file="footer.jsp"/>

</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#reviewForm").validate({
		rules: {
			headline: "required",
			comment: "required"
		},
		
		messages: {
						
			headline: "Please enter headline",
			comment: "Please enter comment"
			
		}
	});
	
	$("#buttonCancel").click(function() {
		history.go(-1);
	});
});
</script>
</html>