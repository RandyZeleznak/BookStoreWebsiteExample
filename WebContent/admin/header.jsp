<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<div align="center">
		<div>
		<img src="../images/trebleheartbeat.png">
		</div>
		<div> 
			Welcome,  <c:out value="${sessionScope.userEmail}"/> <a href="logout">Logout</a>
			
		</div>
		<div id="headermenu">
		<div>
			<a href="list_users">
				<img src="../images/user.png"/><br/>USERS</a>
		</div>
		<div> 
			<a href="list_categories">
				<img src="../images/category.png"/><br/>Categories</a>
		</div>
		<div>
			<a href="list_books">
				<img src="../images/books.png"/><br/>BOOKS</a>
		</div>
		<div>
			<a href="customers">
				<img src="../images/customers.png"/><br/>Customers</a>
		</div>
		<div>
			<a href="reviews">
				<img src="../images/reviews.png"/><br/>Reviews</a>
		</div>
		<div>
			<a href="orders">
				<img src="../images/orders.png"/><br/>Orders</a>
		</div>
		</div>
		
			
	</div>
	
	
