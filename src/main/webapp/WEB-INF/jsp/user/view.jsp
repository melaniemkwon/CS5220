<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="container">
	<div class="row">
		<div class="col-sm-10"><h1>User Info</h1></div>
		<div class="col-sm-10"><h2>${user.firstName} ${user.lastName}</h2></div>
		<div class="col-sm-10"><h4>${user.email} </h4></div>
		<div class="col-sm-10"><h4>${user.role} </h4></div>
	</div>
</div>
  		
<h1>For test form assignment</h1>
 		
<div class="container">
	<table id="formTable" class="table table-striped table-bordered">
		<thead>
			<tr><th >ID</th><th>Form Name</th><th>Description</th><th>Enabled</th><th>Total Pages</th><th>Operations</th></tr>
		</thead>
		<tbody>
			<c:forEach items="${forms}" var="form">
			<tr>
				<td  class="col-md-1" >${form.id}</td>
				<td  class="col-md-2">${form.name}</td>
				<td  class="col-md-2">${form.description}</td>
				<td  class="col-md-1">${form.enabled}</td>
				<td  class="col-md-1">${form.totalPages}</td>
				<td  class="col-md-2">
					<a class="btn" href="viewPage.html?id=${form.id}&pageNum=1" data-toggle="tooltip" title="View Form"><i class="glyphicon glyphicon-eye-open"></i></a>
					<a class="btn" href="editPage.html?id=${form.id}&pageNum=1" data-toggle="tooltip" title="Edit Form Page"><i class="glyphicon glyphicon-pencil"></i></a>
					<a class="btn" href="deleteForm.html?id=${form.id}" data-toggle="tooltip" title="Delete Form"><i class="glyphicon glyphicon-trash"></i></a>
					<a class="btn" href="listAssignForm.html?id=${form.id}" data-toggle="tooltip" title="Assign Form"><i class="glyphicon glyphicon-open-file"></i></a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="col-md-offset-10">
	<a href="addForm.html" id="popupAddForm"><button type="button" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span> ADD NEW FORM </button></a>
</div>

<script src="<c:url value='/assets/vendors/DataTables-1.10.13/js/jquery.dataTables.min.js' />"></script>
<script src="<c:url value='/assets/vendors/DataTables-1.10.13/js/dataTables.bootstrap.min.js' />"></script>

<script>
  $(document).ready(function(){
	    $('#formTable').DataTable();
	    $('#formTable_filter').addClass('form-group');
	});
</script>
