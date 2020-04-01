<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Bookstore Manage Review Administration Page</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
	<div>
	<h2 class="pageheading"> Manage Review Administration</h2>
	
	<br/><br>
	</div>
	
	<c:if test="${message != null}">
	<div align="center">
	<h4 class="message"> ${message}</h4>
	</div>
	</c:if>
	

	<div align="center">
		<table border="1" cellpadding="5">
			<tr>
			<th>Index</th>
			<th>ID</th>
			<th>Book</th>
			<th>Rating</th>
			<th>Headline</th>
			<th>Customer</th>
			<th>Review On</th>
			<th>Actions</th>
			</tr>
			<c:forEach var="review" items="${listReviews}" varStatus="status">
			<tr>
				<td>${status.index + 1}</td>
				<td>${review.reviewId}</td>
				<td>${review.book.title}</td>
				<td>${review.rating}</td>
				<td>${review.headline}</td>
				<td>${review.customer.fullName}</td>
				<td>${review.reviewTime}</td>
				<td> 
					<a href="edit_review?id=${review.reviewId}">Edit</a> &nbsp
					<a href="javascript:void(0);" class="deleteLink" id="${review.reviewId}">Delete</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	</div>
	<jsp:directive.include file="footer.jsp"/>
	
	<script>
	$(document).ready(function(){
		$(".deleteLink").each(function(){
			$(this).on("click",function(){
				reviewId= $(this).attr("id");
				if(confirm("Are You Sure you want to delete Review ID: "+reviewId+"?")){
					window.location = 'delete_review?id=' +reviewId;
				}
			});
		});
	});
	
	</script>
</body>
	
</html>