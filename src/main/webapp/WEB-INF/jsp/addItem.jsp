<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add Item</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value="/resources/css/add-item.css" />" />
<body>
	<div class="grid-container">
		<!-- row 1 -->
		<div class="header">
			<jsp:include page="navigation-bar.jsp"></jsp:include>
		</div>
		<!-- row 2 -->
		<div class="form-container">
			<form:form class="form-grid-container" modelAttribute="item"
				action="additem">

				<div>
					<label for="inputItem" class="label">Item</label>
					<form:input type="text" path="itemName" class="text" id="inputItem" required="required"/>
				</div>

				<div>
					<label for="inputSource" class="label">Category</label>
					<form:select path="category.categoryId" id="inputSource"
						class="dropdown" required="required">
						<form:option value="">Select category...</form:option>
						<c:forEach var="category" items="${itemTypeCategoryList}">
							<form:option value="${category.categoryId}">${category.categoryName}</form:option>
						</c:forEach>
					</form:select>
				</div>

				<div>
					<button type="submit" class="form-submit-button">Add</button>
				</div>
			</form:form>
		</div>
	</div>



</body>
</html>