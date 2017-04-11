<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container">
	<h2>Form assignment of : ${form.name }</h2>
	<table id="userTable" class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>ID</th>
				<th>Username</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Assign Status</th>
				<th>Operations</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user">
				<c:set var="contains" value="false" />
				<c:forEach items="${user.forms}" var="item">
					<c:if test="${item eq form}">
						<c:set var="contains" value="true" />
					</c:if>
				</c:forEach>
				<tr>
					<td class="col-md-1">${user.id}</td>
					<td class="col-md-1">${user.username}</td>
					<td class="col-md-2">${user.firstName}</td>
					<td class="col-md-2">${user.lastName}</td>
					<c:choose>
						<c:when test="${contains }">
							<td class="col-md-1"><div style="text-align: center; color: green" data-toggle="tooltip" title="Assigned">
									<i class="glyphicon glyphicon-export" style="font-size: 1.5em"></i>
								</div></td>
							<td class="col-md-1"><a class="btn disabled" href="" data-toggle="tooltip" title="Assign Form"><i class="glyphicon glyphicon-ok"></i></a> <a class="btn"
								href="deassignForm.html?id=${form.id}&uId=${user.id}" data-toggle="tooltip" title="Deassgin Form" style="color: red"><i class="glyphicon glyphicon-remove"></i></a></td>
						</c:when>
						<c:otherwise>
							<td class="col-md-1"><div style="text-align: center;" data-toggle="tooltip" title="Not assign">
									<i class="glyphicon glyphicon-minus" style="font-size: 1.5em"></i>
								</div></td>
							<td class="col-md-1"><a class="btn" href="assignForm.html?id=${form.id}&uId=${user.id}" data-toggle="tooltip" title="Assign Form" style="color: green"><i class="glyphicon glyphicon-ok"></i></a>
								<a class="btn disabled" href="" data-toggle="tooltip" title="Deassgin Form"><i class="glyphicon glyphicon-remove"></i></a></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<!-- Modal -->
<div id="successModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<!--                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>-->
				<h4 class="modal-title">Success</h4>
			</div>
			<div class="modal-body">
				<p>Your information is successfully added.</p>
			</div>
			<div class="modal-footer">
				<button id="closeSuccessModal" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script src="<c:url value='/assets/vendors/DataTables-1.10.13/js/jquery.dataTables.min.js' />"></script>
<script src="<c:url value='/assets/vendors/DataTables-1.10.13/js/dataTables.bootstrap.min.js' />"></script>

<script>
	$(document).ready(function() {
		$('#userTable').DataTable();
		$('#userTable_filter').addClass('form-group');
	});
</script>
