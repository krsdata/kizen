<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<!-- Bootstrap Core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- bootswatch theme CSS -->
<link href="${css}/bootstrap-readable-them.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${css}/myapp.css" rel="stylesheet">

<title>Kaizen Industries - ${title}</title>

</head>

<body>

	<div class="wrapper">
		
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
             <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" style="color: red; text-decoration: underline;" href="${contextRoot}/home">Home</a>
            </div>
        </div>
       </nav>


		<!-- Page Content -->
		<div class="content">

			<div class="container">
			
			     <div class="row">
			
			         <div class="col-xs-12">
			         
			            <div class="jumbotron">
			            
			               <h1>${errorTitle}</h1>
			               <hr/>
			               
			               <blockquote style="word-wrap:break-word">
			                   
			                   ${errorDescription}
			                   
			               </blockquote>
			            
			            </div>
			         
			         </div>
			
			     </div>
			
			</div>
			
		</div>

		<!-- footer comes here -->
		<%@include file="./shared/footer.jsp"%>


	</div>
</body>

</html>
