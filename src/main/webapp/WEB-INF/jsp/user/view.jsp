<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	
  		<div class="col-sm-10"><h1>User Info</h1></div>
  		<div class="col-sm-10"><h2>${user.firstName} ${user.lastName}</h2></div>
  		<div class="col-sm-10"><h4>${user.email} </h4></div>
  		<div class="col-sm-10"><h4>${user.role} </h4></div>
