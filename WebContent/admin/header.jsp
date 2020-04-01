<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<div align="center">
		<div>
		<a href="${pageContext.request.contextPath}/admin/">
			<img src="../images/trebleheartbeat.png" width="300" height="250">
		</a>
		</div>
		<div> 
			Welcome,  <c:out value="${sessionScope.userEmail}"/> <a href="logout">Logout</a>
			
		</div>
		<div id="headermenu">
		<div>
			<a href="list_users">
				<img src="../images/user.png" width="40" height="50"/><br/>USERS</a>
		</div>
		<div> 
			<a href="list_categories">
				<img src="../images/category.png" width="40" height="50"/><br/>Categories</a>
		</div>
		<div>
			<a href="list_books">
				<img src="../images/books.png" width="40" height="50"/><br/>BOOKS</a>
		</div>
		<div>
			<a href="list_customer">
				<img src="../images/customers.png" width="40" height="50"/><br/>Customers</a>
		</div>
		<div>
			<a href="list_review">
				<img src="../images/reviews.png" width="40" height="50"/><br/>Reviews</a>
		</div>
		<div>
			<a href="orders">
				<img src="../images/orders.png" width="30" height="30"/><br/>Orders</a>
		</div>
		</div>
		
			
	</div>
	
	
