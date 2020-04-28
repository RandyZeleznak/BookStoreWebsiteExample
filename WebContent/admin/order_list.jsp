<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Bookstore Manage Orders Administration Page</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
	<div>
	<h2 class="pageheading"> Manage Book Orders Administration</h2>
	
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
			<th>Order ID</th>
			<th>Ordered by</th>
			<th>Book Copies</th>
			<th>Total</th>
			<th>Payment method</th>
			<th>Status</th>
			<th>Order Date</th>
			<th>Actions</th>
			</tr>
			<c:forEach var="order" items="${listOrder}" varStatus="status">
			<tr>
				<td>${status.index + 1}</td>
				<td>${order.orderId}</td>
				<td>${order.customer.fullName}</td>
				<td>${order.bookCopies}</td>
				<td><fmt:formatNumber value="${order.orderTotal}" type="currency"/></td>
				<td>${order.paymentMethod}</td>
				<td>${order.orderStatus}</td>
				<td>${order.orderDate}</td>
				
				
				<td> 
					<a href="view_order?id=${order.orderId}">Details</a> &nbsp
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