<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit order -Bookstore  Administration Page</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>

	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
	<div>
	<h2 class="pageheading"> Edit Details of Order ID: ${order.orderId}</h2>
	
	</div>
	
	<c:if test="${message != null}">
	<div align="center">
	<h4 class="message"> ${message}</h4>
	</div>
	</c:if>
	
	
	<form action="update_order" method="post" id="orderForm">

	<div align="center">
		
		
		<table>
			<tr>
				<td> Ordered By: </td>
				<td> ${order.customer.fullName }</td>
			</tr>
			<tr>
				<td> Order Date: </td>
				<td>${order.orderDate}</td>
			</tr>
			<tr>
				<td> Payment Method : </td>
				<td>
					<select name="paymentMethod">
						<option value="Cash On Delivery" <c:if test="${order.paymentMethod eq 'Cash On Delivery'}">selected='selected'</c:if>>Cash On Delivery</option>
						<option value="paypal"<c:if test="${order.paymentMethod eq 'paypal'}">selected='selected'</c:if> >Paypal or Credit Card</option>
				</td>
			</tr>
			<tr>
				<td> Order Status: </td>
				<td>
					<select name = "orderStatus">
						<option value="Processing" <c:if test="${order.orderStatus eq 'Processing'}">selected='selected'</c:if>>Processing</option>
						<option value="Shipping" <c:if test="${order.orderStatus eq 'Shipping'}">selected='selected'</c:if>>Shipping</option>
						<option value="Delivered" <c:if test="${order.orderStatus eq 'Delivered'}">selected='selected'</c:if>>Delivered</option>
						<option value="Completed" <c:if test="${order.orderStatus eq 'Completed'}">selected='selected'</c:if>>Completed</option>
						<option value="Cancelled" <c:if test="${order.orderStatus eq 'Cancelled'}">selected='selected'</c:if>>Cancelled</option>
					</select>
				</td>
			</tr>
			</table>
				<h2> Recipient Information</h2>
			<table>
			<tr>
				<td> Recipient First Name: </td>
				<td><input type="text" name="firstName" value="${order.firstName}" size="40"/></td>
			</tr>
			<tr>
				<td> Recipient Last Name: </td>
				<td><input type="text" name="lastName" value="${order.lastName}" size="40"/></td>
			</tr>
			<tr>
				<td> Recipient Phone: </td>
				<td><input type="text" name="phone" value="${order.phone}" size="40"/></td>
			</tr>
			<tr>
				<td> Address Line 1: </td>
				<td><input type="text" name="addressLine1" value="${order.addressLine1}" size="40"/></td>
			</tr>
			<tr>
				<td> Address Line 2: </td>
				<td><input type="text" name="addressLine2" value="${order.addressLine2}" size="40"/></td>
			</tr>
			<tr>
				<td> City: </td>
				<td><input type="text" name="city" value="${order.city}" size="40"/></td>
			</tr>
			<tr>
				<td> State : </td>
				<td><input type="text" name="state" value="${order.state}" size="40"/></td>
			</tr>
			
			<tr>
				<td> Zip Code : </td>
				<td><input type="text" name="zipcode" value="${order.zipcode}" size="40"/></td>
			</tr>
			<tr>
			<td>Country:</td>
			<td>
				<select name="country" id="country">
					<c:forEach items="${mapCountries}" var="country">
						<option value="${country.value}" <c:if test="${order.country eq country.value}">selected='selected'</c:if> >${country.key}</option>
					</c:forEach>
				</select>
			</td>
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
				<th></th>
				
			</tr>
			<c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="status">
			<tr>
				<td>${status.index + 1}</td>
				<td>${orderDetail.book.title}</td>
				<td>${orderDetail.book.author}</td>
				<td>
					<input type="hidden" name="price" value="${orderDetail.book.price}" />
					<fmt:formatNumber  value="${orderDetail.book.price}" type="currency"/>
				</td>
				<td>
					<input type="hidden" name="bookId" value="${orderDetail.book.bookId}" />
					<input type="text" name="quantity${status.index + 1}" value="${orderDetail.quantity}" size="5"/>
				</td>
				<td><fmt:formatNumber  value="${orderDetail.subtotal}" type="currency"/></td>
				<td><a href="remove_book_from_order?id=${orderDetail.book.bookId}">Remove</a></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="right">
					<b><i>TOTAL:</i></b>
				</td>
				<td>
					<b>${order.bookCopies}</b>
				</td>	 
				<td colspan="2" align="left">
					<b><fmt:formatNumber  value="${order.orderTotal}" type="currency"/></b>
				</td>
			</tr>
				<tr>
				<td colspan="7" align="right">
					<p>Subtotal: <fmt:formatNumber value="${order.orderSubTotal}" type="currency"/></p>
					<p>Tax: <input type="text" size="5" name="tax" value="${order.tax}"/></p>
					<p>Shipping Fee: <input type="text" size= "5" name="shippingFee" value="${order.shippingFee}" /></p>
					<p>TOTAL: <fmt:formatNumber value="${order.orderTotal}" type="currency"/></p>
				</td>
			</tr>
		</table>
	</div>
	<div align="center">
	<br/>
		<a href="javascript:showAddBookPopUp()"><b>Add Books</b></a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Save"/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="Cancel" onclick="javascript:window.location.href='list_orders';"/>
		
	</div>
	</form>
	
	
	<jsp:directive.include file="footer.jsp"/>
	
	<script>
	
	function showAddBookPopUp(){
		var width = 600;
		var height = 250;
		var left = (screen.width - width) / 2;
		var top = (screen.height - height ) / 2;
		window.open('add_book_form','_blank','width=' + width + ',height=' + height + ',top=' + top + ',left=' + left);
	}
	
	$(document).ready(function() {
		$("#orderForm").validate({
			rules: {
				firstName: "required",
				lastName: "required",
				phone: "required",
				addressLine1: "required",
				city: "required",
				state: "required",
				country: "required",
				zipcode: "required",
				<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
					quantity${status.index + 1}: {
						required: true, number: true, min: 1
					},
				</c:forEach>
					
				shippingFee: {required: true, number: true, min: 0},
				tax: {required: true, number: true, min: 0}
			},
			
			messages: {
							
				firstName: "Please enter Recipient  First Name",
				lastName: "Please enter Recipient Last Name",
				phone: "Please enter Recipient phone",
				addressLine1: "Please enter a Street Address",
				city: "Please enter City",
				state: "Please enter State",
				country: "Please enter Country",
				zipcode: "Please enter Zip Code",
				<c:forEach items="${order.orderDetails}" var="book" varStatus="status">
					quantity${status.index + 1}: {
						required: "please enter quantity",
						number: "Please enter a number",
						min: "Quantity must be at least one(1)",
						},
				</c:forEach>
						
				shippingFee:{
					required: "Please enter shipping fee",
					number: "Shipping fee must be numeric",
					min: "Shipping fee must be equal or greater than 0"
				},
				tax:{
					required: "Please enter tax",
					number: "Tax must be numeric",
					min: "Tax must be equal or greater than 0"
				}
				
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
	
	</script>
</body>
	
</html>