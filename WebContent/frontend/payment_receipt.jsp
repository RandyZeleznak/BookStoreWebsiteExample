<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Receipt - Online Bookstore </title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>	
</head>
<body>

	<jsp:directive.include file="header.jsp"/>

	<div align="center">
	<h2><i> Payment has been successfully processed.  Thank you for your business. </h2>
	<jsp:directive.include file="receipt.jsp"/>
		<div>
			<br/>
			<input type="button" value="Print Receipt" onclick="javascript:showPrintReciptPopup();"/>
		</div>
	</div>
	
	<jsp:directive.include file="footer.jsp"/>
	
	
	<script>
		function showPrintReciptPopup(){
			var width = 600;
			var height = 250;
			var left = (screen.width - width) / 2;
			var top = (screen.width - width) / 2;
			
			window.open('frontend/print_receipt.jsp','_blank',
					'width=' +width+ ', height= ' +height+
					', top=' +top+ ', left= ' +left) ;
		}
	</script>

</body>
</html>