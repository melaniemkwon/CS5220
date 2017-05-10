<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<security:authentication var="principal" property="principal" />
<div class="container">
	<div class="jumbotron">
		<h2>Welcome ${principal.username} to Formbuilder</h2>
		<ul>
			<li><a href="/formbuilder/form/listForm.html">Forms Management</a></li>
			<li><a href="/formbuilder/user/list.html">User Management</a></li>
			<li><a href="pdf/upload.html">Upload PDF</a></li>
		</ul>
	</div>
</div>
