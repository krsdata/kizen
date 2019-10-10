<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">
 
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Kaizen Industries-${title}</title>
<link rel="icon" href="${images}/kizen-s-logo.png">

<script>
	window.menu = '${title}';
	
	window.contextRoot = '${contextRoot}'
</script>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Readable Theme -->
<link href="${css}/bootstrap-readable-them.css" rel="stylesheet">

<!-- Bootstraps DataTables -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<link href="${css}/owl.carousel.css" rel="stylesheet">
<link href="${css}/owl.theme.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${css}/myapp.css" rel="stylesheet">


</head>

<body>

	<div class="wrapper">

		<!-- Navigation -->
		<%@include file="./shared/navbar.jsp"%>

		<div class="content">
			<!-- Page Content -->
			<!-- Loading the home content -->
			<c:if test="${userClickHome == true }">
				<%@include file="home.jsp"%>
			</c:if>

			<!-- Load only when user clicks about -->
			<c:if test="${userClickAbout == true }">
				<%@include file="about.jsp"%>
			</c:if>

			<!-- Load only when user clicks service -->
			<c:if test="${userClickServices == true }">
				<%@include file="services.jsp"%>
			</c:if>

			<!-- Load only when user clicks products -->
			<c:if test="${userClickAllProducts == true or userClickCategoryProducts == true}">
				<%@include file="listProducts.jsp"%>
			</c:if>

			<!-- Load only when user clicks contact -->
			<c:if test="${userClickContact == true }">
				<%@include file="contact.jsp"%>
			</c:if>
			
			<!-- Load only when user clicks machining -->
			<c:if test="${userClickMachining == true }">
				<%@include file="machining.jsp"%>
			</c:if>
			
			<!-- Load only when user clicks single Product -->
			<c:if test="${userClickShowProduct == true }">
				<%@include file="singleProduct.jsp"%>
			</c:if>
			
			<!-- Load only when user clicks manageProducts -->
			<%-- <c:if test="${userClickManageProducts == true }">
				<%@include file="manageProducts.jsp"%>
			</c:if> --%>
		</div>


		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>

		<!-- jQuery -->
		<script src="${js}/jquery.js"></script>
		<%-- <script src="${js}/jquery.min.js"></script> --%>
		
		<!-- jQuery validate -->
        <script src="${js}/jquery.validate.js"></script>
        <%-- <script src="${js}/jquery.validate.min.js"></script> --%>
        
        <!-- Bootstrap core JavaScript -->
		<script src="${js}/bootstrap.bundle.min.js"></script>
		
		<!-- DataTable Plugin -->
        <script src="${js}/jquery.dataTables.js"></script>
        
         <%-- <!-- DataTable Bootstrap Script -->
        <script src="${js}/dataTables.bootstrap.js"></script> --%> 
        
        <!-- DataTable Bootstrap Script -->
        <script src="${js}/dataTables.bootstrap4.js"></script>

        <!-- Bootbox Script -->
        <script src="${js}/bootbox.min.js"></script>
        
         <script src="${js}/owl.carousel.min.js"></script>
        
       <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
        <!--<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY&callback=myMap"></script>-->
        
		<!-- self coded JavaScript -->
		<script src="${js}/myapp.js"></script>

	</div>

</body>

</html>
