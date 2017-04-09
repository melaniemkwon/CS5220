<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="formbuilder" uri="http://formbuilder.com/formbuilder"%>

<div class="row">
	<div class="col-md-offset-3 col-md-6">

		<div class="text-center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:forEach begin="1" end="${form.totalPages}" step="1" var="i">
						<c:choose>
							<c:when test="${param.pageNum eq i }">
								<li class="active"><a href="" onclick="return false">${i} </a></li>
							</c:when>
							<c:otherwise>
								<li><a href="viewPage.html?id=${param.id}&pageNum=${i}">${i} </a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>

	<H2>FORM : ${form.name}</H2>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4 class="panel-title">PAGE ${param.pageNum}</h4>
		</div>
		<div class="text-center">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:forEach begin="1" end="${form.totalPages}" step="1" var="i">
						<c:choose>
							<c:when test="${param.pageNum eq i }">
								<li class="active"><a href="" onclick="return false">${i} </a></li>
							</c:when>
							<c:otherwise>
								<li><a href="viewPage.html?id=${param.id}&pageNum=${i}">${i} </a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
