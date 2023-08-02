<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Source</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value="/resources/css/add-source.css" />" />
</head>
<body>
	<div class="grid-container">
		<!--row 1 -->
		<div class="header">
			<jsp:include page="navigation-bar.jsp"></jsp:include>
		</div>
		
		<!-- row2 -->
		<div class="form-container">
			<form:form class="form-grid-container" method="POST" modelAttribute="source"
			action="addsource">

			<div>
				<label for="inputSource" class="label">Source</label>
				<form:input type="text" path="sourceName" class="text"
					id="inputSource" required="required"/>
			</div>
			
			<div>
				<label for="inputAddress" class="label">Address</label>
				<form:input type="text" path="sourceAddress" class="text"
					id="inputAddress" />
			</div>

			<div class="col-12">
				<button type="submit" class="form-submit-button">Add</button>
			</div>
		</form:form>
		
		</div>
		
	</div>

	
	
</body>
</html>