<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url value="/" var="docroot" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Title</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<style>
body {
	min-height: 2000px;
	padding-top: 70px;
}
</style>
</head>
<body>
<!-- Fixed navbar -->
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
				<a class="navbar-brand" href="/formbuilder/">Formbuilder</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/formbuilder/">Home</a></li>
					<li><a href="/formbuilder/user/list.html">Users</a></li>
					<li class="active"><a href="/formbuilder/form/list.html">Forms</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Dropdown <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Menu1</a></li>
					<li><a href="#">Menu2</a></li>
					<li class="active"><a href="./">Menu3<span class="sr-only">(current)</span></a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
<div class="container">
	<table class="table">
	<tr><th>ID</th><td>${form.id}</td></tr>
	<tr><th>Name</th><td>${form.name}</td></tr>
	<tr><th>Description</th><td>${form.description}</td></tr>
	<tr><th>Available</th><td>
	<c:choose>
	  <c:when test="${form.available==true}">
	  <input type="checkbox" name="available" value="true" checked/> Available
	  <input type="checkbox" name="available" value="false"/> Unavailable
	  </c:when>
	  <c:otherwise>
	  <input type="checkbox" name="available" value="true" /> Available
	  <input type="checkbox" name="available" value="false" checked/> Unavailable
	  </c:otherwise>
	</c:choose>
	<tr><th>User</th><td><a href="user/view/${form.user.id}.html">${form.user.id}</a></td></tr>
	<tr><th>Page Number</th><td>Total: ${fn:length(form.pages)} 
	<c:forEach begin="1" end="${fn:length(form.pages)}" varStatus="loop">
		<a href="${docroot}form/page_view.html?id=${form.id}&p=${loop.index}">${loop.index}</a>
	</c:forEach>
	</td></tr>
	
	</table>
	<a href="${docroot}form/edit_form.html?id=${form.id}">Edit Form</a><br/>
	<a href="${docroot}form/add_page.html?id=${form.id}">Add Page</a><br/>
</div>
</body>
</html>