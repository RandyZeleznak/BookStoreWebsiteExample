<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bookstore Category Administration Page</title>
</head>
<body>

	<jsp:directive.include file="header.jsp"/>
	
	<div align="center">
	<div>
	<h2> Category Administration Dashboard</h2>
	<h3> <a href="category_form.jsp">Create New Category</a> </h3>
	
	<br/><br>
	</div>
	
	
	<div align="center">
	<h4> <i>${message}</i></h4>
	</div>

	<div align="center">
		<table border="1" cellpadding="5">
			<tr>
			<th>Index</th>
			<th>ID</th>
			<th>Category Name</th>
			<th>Actions</th>
			</tr>
			<c:forEach var="cat" items="${listCategories}" varStatus="status">
			<tr>
				<td>${status.index + 1}</td>
				<td>${cat.categoryId}</td>
				<td>${cat.name }</td>
				<td> 
					<a href="edit_category?id=${cat.categoryId}">Edit</a> &nbsp
					<a href="javascript:confirmDelete(${cat.categoryId})">Delete</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<script>
	function confirmDelete(categoryId){
		if(confirm("Are You Sure you want to delete category ID: "+categoryId+"?")){
			window.location = 'delete_category?id=' +categoryId;
		}
	}
	

	</script>

	</div>
	<jsp:directive.include file="footer.jsp"/>
</body>
</html>