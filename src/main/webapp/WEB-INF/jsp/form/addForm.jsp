<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="col-md-6 col-md-offset-3">
	<div class="page-header">
		<h2>Add New Form</h2>
	</div>

	<div class="panel panel-success">
		<div class="panel-heading">
			<h4 class="panel-title">Enter New Form Information</h4>
		</div>
		<div class="panel-body">
			<form:form modelAttribute="form" class="form">
				<div class="form-group">
					<div>
						<label>Name</label>
					</div>
					<form:input path="name" cssClass="form-control" required="required" />
				</div>
				<div class="form-group">
					<div>
						<label>Description</label>
					</div>
					<form:textarea path="description" cssClass="form-control" />
				</div>
				<div class="form-group">
					<div>
						<label>Notification Email</label>
					</div>
					<form:input path="notificationEmail" cssClass="form-control" />
				</div>
				<div class="form-group">
					<form:checkbox path="enabled" label="Enable" />
				</div>

				<button type="submit" class="btn btn-success btn-raised">
					<span class="glyphicon glyphicon-plus-sign"></span> ADD
				</button>
			</form:form>
		</div>
	</div>
</div>

