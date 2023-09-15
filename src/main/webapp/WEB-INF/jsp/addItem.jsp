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
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/add-item.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/custom-modal.css" />" />
<script src="<c:url value="/resources/js/custom-modal.js"/>" defer></script>
<script src="<c:url value="/resources/js/item.js"/>" defer></script>
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
					<form:input type="text" path="itemName" class="text" id="inputItem"
						required="required" />
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

		<!-- row3 -->
		<div class="datatable-container">
			<table id="itemTable" class="display itemTable">
				<thead>
					<tr>
						<th>item</th>
						<th>category</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${itemList}">
						<tr>
							<td>${item.itemName}</td>
							<td>${item.category.categoryName}</td>
							<td><button
									onclick="editItem('${item.itemId}','${item.itemName}', '${item.category.categoryName}', '${item.category.categoryId}' )"
									style="border: none; background: none">
									<span class="fa fa-pencil"></span>
								</button></td>
							<td><form:form method="POST" modelAttribute="item"
									action="deleteitem">
									<form:input type="hidden" value="${item.itemId}" path="itemId"></form:input>
									<button type="submit" style="border: none; background: none">
										<span class="fa fa-trash"></span>
									</button>
								</form:form></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>

	<div class="my-modal" id="add-expense-modal">
		<div class="my-modal-content" id="add-expense-modal-content">
			<span class="close-icon" id="add-expense-modal-close">&times;</span>


			<div class="form-container">
				<form:form class="form-grid-container" modelAttribute="item"
					action="updateitem">

					<div>
						<label for="inputItem" class="label">Item</label>
						<form:input type="text" path="itemName" class="text"
							id="modalInputItem" required="required" />
					</div>

					<div>
						<label for="inputSource" class="label">Category</label>
						<form:select path="category.categoryId" id="modalinputCategory"
							class="dropdown" required="required">
							<form:option value="" id="modalInputCategory">Select category...</form:option>
							<c:forEach var="category" items="${itemTypeCategoryList}">
								<form:option value="${category.categoryId}" >${category.categoryName}</form:option>
							</c:forEach>
						</form:select>
					</div>
					<form:input type="hidden" path="itemId" id="modalInputItemId" />
					<div>
						<button type="submit" class="form-submit-button">Update</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.itemTable').DataTable({
				order : []
			});
		});
	</script>


</body>
</html>