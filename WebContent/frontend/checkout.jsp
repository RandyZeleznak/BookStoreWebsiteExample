<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout of Shopping Cart - Online Bookstore </title>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>	
</head>
<body>

	<jsp:directive.include file="header.jsp"/>

	<div align="center">
		<h2>Shopping Cart</h2>
		
		<c:if test="${message != null}">
			<div align="center">
			<h4 class="message">${message}</h4>
			</div>
		</c:if>
		
		<c:set var="cart" value="${sessionScope['cart']}" />
		
		<c:if test="${cart.totalItems == 0}">
			<h2> There are no items in your cart</h2>
			</c:if>
			
		
		<c:if test = "${cart.totalItems > 0}"> 
				<div>
					<h2> Review your order details  <a href="">Edit</a></h2>
						<table border="1">
							<tr>
								<th>No</th>
								<th colspan="2">Book</th>
								<th>Author</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>SubTotal</th>
							</tr>
							<c:forEach items="${cart.items}" var="item" varStatus="status">
							<tr>
								<td>${status.index + 1}</td>
								<td>
									<img class = "book-small" 
									src="data:image/jpg;base64,${item.key.base64Image}" />
								</td>
								<td><span id="book-title">${item.key.title}</span></td>
								<td> ${item.key.author}</td>
								<td><fmt:formatNumber value="${item.key.price}" type="currency"/></td>
								<td>${item.value}</td>
								<td><fmt:formatNumber value="${item.value * item.key.price}" type="currency"/></td>
								
							</tr>
							</c:forEach>
							
							<tr>
								<td colspan="7" align="right">
									<p>Number of Copies: ${cart.totalQuantity}</p>
									<p>Subtotal: <fmt:formatNumber value="${cart.totalAmount}" type="currency"/></p>
									<p>Tax: <fmt:formatNumber value="${tax}" type="currency"/></p> 
									<p>Shipping Fee: <fmt:formatNumber value="${shippingFee}" type="currency"/></p>
									<p>TOTAL: <fmt:formatNumber value="${total}" type="currency"/></p>
							</tr>
						</table>
						<h2> Your shipping Information </h2>
							<form id="orderForm" action="place_order" method="post">
								<table>
			 					<tr>
									<td> Recipient First Name: </td>
									<td><input type="text" name="firstName" value="${loggedCustomer.firstName}"/></td>
								</tr>
								<tr>
									<td> Recipient Last Name: </td>
									<td><input type="text" name="lastName" value="${loggedCustomer.lastName}"/></td>
								</tr>
								<tr>
									<td> Recipient Phone: </td>
									<td><input type="text" name="phone" value="${loggedCustomer.phone}"/></td>
								</tr>
								<tr>
									<td> Address: </td>
									<td><input type="text" name="addressLine1" value="${loggedCustomer.addressLine1}"/></td>
								</tr>
								<tr>
									<td> Address Line2: </td>
									<td><input type="text" name="addressLine2" value="${loggedCustomer.addressLine2}"/></td>
								</tr>
								<tr>
									<td> City: </td>
									<td><input type="text" name="city" value="${loggedCustomer.city}"/></td>
								</tr>
								<tr>
									<td> State: </td>
									<td><input type="text" name="state" value="${loggedCustomer.state}"/></td>
								</tr>
								<tr>
									<td> Country: </td>
									<td>
										<select name="country" id="country">
										<c:forEach items="${mapCountries}" var="country">
											<option value="${country.value}" <c:if test="${loggedCustomer.country eq country.value}">selected='selected'</c:if> >${country.key}</option>
										</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td> Zip Code: </td>
									<td><input type="text" name="zipcode" value="${loggedCustomer.zipcode}"/></td>
								</tr>
									
								</table>
								<div>
									<h2> Payment </h2>
									Choose your payment method:
									&nbsp;&nbsp;&nbsp;&nbsp;
									<select name="paymentMethod">
										<option value="Cash on Delivery">Cash on Delivery</option>
										<option value="paypal">Paypal</option>
									</select>
								</div>
								<div>
									<table class="normal">
									<tr><td>&nbsp;</td></tr>
										<tr>
											<td></td>
											<td><button type="submit" >Place Order</button></td>
											<td><a href="${pageContext.request.contextPath}/">Continue Shopping</a></td>
											
											<td>
										</tr>
									</table>
								</div>
							</form>
						</div>
						
						
						
		</c:if>	
	
	</div>
	
	<jsp:directive.include file="footer.jsp"/>

</body>

	<script type="text/javascript">
	
		$(document).ready(function(){
			$("#orderForm").validate({
				rules:{
					firstName: "required",
					lastName: "required",
					phone: "required",
					addressLine1: "required",
					city: "required",
					state: "required",
					country: "required",
					zipcode: "required",
				},
				messages:{
					firstName: "Please enter Recipients First Name",
					lastName: "Please enter Recipients Last Name",
					phone: "Please enter phone",
					addressLine1: "Please enter Street Address",
					city: "Please enter City",
					state: "Please enter State",
					country: "Please enter Country",
					zipcode: "Please enter Zip Code",
				}
			});
		});
		</script>
		
	</html>