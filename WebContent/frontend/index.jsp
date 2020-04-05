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
					<div  class = "book">
						<div>
							<div>
								<a href="view_book?id=${book.bookId}">
								<img class = "book-small" src="data:image/jpg;base64,${book.base64Image}"/>
								</a>
							</div>
							<div>
							<a href="view_book?id=${book.bookId}">
								<b>${book.title}</b>
							</a>
							</div>
							
							<jsp:directive.include file="book_rating.jsp"/>
							
							
							<div><i> by ${book.author}</i></div>
							<div><b>$ ${book.price}</b></div>
							
						</div>
					</div>
				</c:forEach> 	
				
			<div class = "next-row">
				<h2> Best Selling Books:</h2>
			</div>
			<div class = "next-row">
				<h2> Most-favored Books:</h2>
			</div>
	</div>
	
	<jsp:directive.include file="footer.jsp"/>
	
</body>
</html>