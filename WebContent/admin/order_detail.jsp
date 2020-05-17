<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Bookstore Order Details Administration Page</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
	<div>
	<h2 class="pageheading"> Details of Order ID: ${order.orderId}</h2>
	
	</div>
	
	<c:if test="${message != null}">
	<div align="center">
	<h4 class="message"> ${message}</h4>
	</div>
	</c:if>
	

	<div align="center">
		<h2> Order Overview: </h2>
		
		<table>
			<tr>
				<td> Ordered By: </td>
				<td> ${order.customer.fullName }</td>
			</tr>
			<tr>
				<td> Book Copies: </td>
				<td> ${order.bookCopies }</td>
			</tr>
			<tr>
				<td> Total Amount : </td>
				<td><fmt:formatNumber  value="${order.orderTotal}" type="currency"/></td>
			</tr>
			<tr>
				<td> Recipient Name: </td>
				<td>${order.recipientName}</td>
			</tr>
			<tr>
				<td> Recipient Phone: </td>
				<td>${order.recipientPhone}</td>
			</tr>
			<tr>
				<td> Payment Method : </td>
				<td>${order.paymentMethod}</td>
			</tr>
			<tr>
				<td> Shipping Address: </td>
				<td>${order.shippingAddress}</td>
			</tr>
			<tr>
				<td> Order Status: </td>
				<td>${order.orderStatus}</td>
			</tr>
			<tr>
				<td> Order Date: </td>
				<td>${order.orderDate}</td>
			</tr>
		</table>
	</div>
	<div align="center">
		<h2>Ordered Books</h2>
		<table border="1">
			<tr>
				<th>Index</th>
				<th>Book Title</th>
				<th>Author</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>SubTotal</th>
			</tr>
			<c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
			<tr>
				<td>${status.index + 1}</td>
				<td>
					<img style="vertical-align:middle;" src="data:image/jpg;base64,${orderDetail.book.base64Image}" width="48" height="64"/>
					${orderDetail.book.title}
				</td>
				<td>${orderDetail.book.author}</td>
				<td><fmt:formatNumber  value="${orderDetail.book.price}" type="currency"/></td>
				<td>${orderDetail.quantity}</td>
				<td><fmt:formatNumber  value="${orderDetail.subtotal}" type="currency"/></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="right">
					<b><i>TOTAL:</i></b>
				</td>
				<td>
					<b>${order.bookCopies}</b>
				</td>	 
				<td>
					<b><fmt:formatNumber  value="${order.orderTotal}" type="currency"/></b>
				</td>
			</tr>
		</table>
	</div>
	<div align="center">
	<br/>
		<a href="">Edit this Order</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="">Delete this Order</a>
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