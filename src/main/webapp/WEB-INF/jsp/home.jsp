<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Home</title>
		<link rel="stylesheet" href="<c:url value='/assets/vendors/bootstrap-3.3.7-dist/css/bootstrap.min.css' />">
		<style>
			body {
				padding-top: 70px;
			}
		</style>
	</head>
	<body>
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/FormBuilder/">Formbuilder</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="/formbuilder/">Home</a></li>
						<li><a href="/formbuilder/user/list.html">Users</a></li>
						<li><a href="/formbuilder/form/listForm.html">Forms</a></li>
					</ul>
				</div>
			</div>
		</nav>
	
		<div class="container">
			<div class="jumbotron">
				<h2>Welcome to Formbuilder</h2>		
			</div>
		</div>
		       		
		<script src="<c:url value='/assets/vendors/jquery/jquery-3.2.0.min.js' />"></script>
		<script src="<c:url value='/assets/vendors/bootstrap-3.3.7-dist/js/bootstrap.min.js' />"></script>
	</body>
</html>
