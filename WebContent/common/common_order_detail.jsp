
	<div align="center">
		<h2> Order Overview: </h2>
		
		<table>
			<tr>
				<td> Ordered By: </td>
				<td> ${order.customer.fullName }</td>
			</tr>
			<tr>
				<td> Order Status: </td>
				<td>${order.orderStatus}</td>
			</tr>
			<tr>
				<td> Order Date: </td>
				<td>${order.orderDate}</td>
			</tr>
			<tr>
				<td> Payment Method : </td>
				<td>${order.paymentMethod}</td>
			</tr>
			<tr>
				<td> Book Copies: </td>
				<td> ${order.bookCopies }</td>
			</tr>
			<tr>
				<td> Total Amount : </td>
				<td><fmt:formatNumber  value="${order.orderTotal}" type="currency"/></td>
			</tr>
		</table>
			<h2> Recipient Information </h2>
		<table>
			<tr>
				<td> Recipient First Name: </td>
				<td>${order.firstName}</td>
			</tr>
			<tr>
				<td> Recipient Last Name: </td>
				<td>${order.lastName}</td>
			</tr>
			<tr>
				<td> Recipient Phone: </td>
				<td>${order.phone}</td>
			</tr>
			
			<tr>
				<td> Shipping Address Line 1: </td>
				<td>${order.addressLine1}</td>
			</tr>
			<tr>
				<td> Shipping Address Line 2: </td>
				<td>${order.addressLine2}</td>
			</tr>
			<tr>
				<td> City: </td>
				<td>${order.city}</td>
			</tr>
			<tr>
				<td> State: </td>
				<td>${order.state}</td>
			</tr>
			<tr>
				<td> Country: </td>
				<td>${order.countryName}</td>
			</tr>
			<tr>
				<td> Zip Code: </td>
				<td>${order.zipcode}</td>
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
				<td colspan="6" align="right">
					<p>Subtotal: <fmt:formatNumber value="${order.orderSubTotal}" type="currency"/></p>
					<p>Tax: <fmt:formatNumber value="${order.tax}" type="currency"/></p>
					<p>Shipping Fee: <fmt:formatNumber value="${order.shippingFee}" type="currency"/></p>
					<p>TOTAL: <fmt:formatNumber value="${order.orderTotal}" type="currency"/></p>
				</td>
			</tr>
		</table>
	</div>