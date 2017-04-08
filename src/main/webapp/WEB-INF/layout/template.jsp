<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><tiles:insertAttribute name="title" defaultValue="FormBuilder" defaultValueType="string" /></title>
<link rel="stylesheet" href="<c:url value='/assets/vendors/bootstrap-3.3.7-dist/css/bootstrap.min.css' />">
<link rel="stylesheet" href="<c:url value='/assets/vendors/bootstrap-material-design/css/bootstrap-material-design.min.css' />">
<link rel="stylesheet" href="<c:url value='/assets/vendors/bootstrap-material-design/css/ripples.min.css' />">
<link rel="stylesheet" href="<c:url value='/assets/vendors/DataTables-1.10.13/css/dataTables.bootstrap.css' />">
<link rel="stylesheet" href="<c:url value='/assets/resources/css/formbuilder.css' />">
</head>
<body>

	<tiles:insertAttribute name="header" defaultValue="header.jsp" defaultValueType="template" />
	<div id="content">
		<tiles:insertAttribute name="content" />
	</div>
	<tiles:insertAttribute name="footer" defaultValue="footer.jsp" defaultValueType="template" />

	<script src="<c:url value='/assets/vendors/jquery/jquery-3.2.0.min.js' />"></script>
	<script src="<c:url value='/assets/vendors/bootstrap-3.3.7-dist/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/assets/vendors/DataTables-1.10.13/js/jquery.dataTables.min.js' />"></script>
	<script src="<c:url value='/assets/vendors/DataTables-1.10.13/js/dataTables.bootstrap.min.js' />"></script>

	<script>
		$(document).ready(function() {
			$('#formTable').DataTable();
			$('#formTable_filter').addClass('form-group');
		});
	</script>

	<!-- Material Design for Bootstrap -->
	<script src="<c:url value='/assets/vendors/bootstrap-material-design/js/material.js' />"></script>
	<script src="<c:url value='/assets/vendors/bootstrap-material-design/js/ripples.min.js' />"></script>
	<script>
		$.material.init();
	</script>
	
</body>
</html>
