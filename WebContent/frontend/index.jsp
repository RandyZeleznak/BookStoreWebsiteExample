<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Z-Squared Book Store</title>
<link rel="stylesheet" href="css/style.css">	
</head>
<body>
	
	
	
	<jsp:directive.include file="header.jsp"/>
	
	<div class="center">
		<h2> New Book</h2>
				<c:forEach items="${listNewBooks}" var="book">
					<jsp:directive.include file="book_group.jsp"/>
				</c:forEach> 	
				
			<div class = "next-row">
				<h2> Best Selling Books:</h2>
				<c:forEach items="${listBestSellingBooks}" var="book">
					<jsp:directive.include file="book_group.jsp"/>
				</c:forEach> 
			</div>
			<div class = "next-row">
			
				<h2> Most-favored Books:</h2>
				<c:forEach items="${listMostFavoriteBooks}" var="book">
					<jsp:directive.include file="book_group.jsp"/>
				</c:forEach>
			</div>
	</div>
	
	<jsp:directive.include file="footer.jsp"/>
	
</body>
</html>