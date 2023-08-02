<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add expenditure</title>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="<c:url value="/resources/css/add-expense.css" />" />
</head>
<body>

	<div class="grid-container">
		<!--row 1 -->
		<div class="header">
			<jsp:include page="navigation-bar.jsp"></jsp:include>
		</div>

		<!-- row 2 -->
		<div class="form">
			<form:form method="POST" modelAttribute="expenditure"
				action="addexpenditure" class="form-container">

				<div>
					<label for="item" class="label">Item</label>
					<form:select path="item.itemId" id="item" class="dropdown">
						<form:option value="NONE">Select item...</form:option>
						<c:forEach var="item" items="${itemList}">
							<form:option value="${item.itemId}">${item.itemName}</form:option>
						</c:forEach>
					</form:select>
				</div>

				<div>
					<label for="quantity" class="label">Quantity</label>
					<form:input type="text" path="quantity" class="text" id="quantity" />
				</div>
				<div>
					<label for="amount" class="label">Amount</label>
					<form:input type="text" path="amount" class="text" id="amount" />
				</div>
				<div>
					<label for="source" class="label">Source</label>
					<form:select path="source.sourceId" id="source" class="dropdown">
						<form:option value="NONE" label="Choose...">Select source...</form:option>
						<c:forEach var="source" items="${sourceList}">
									<form:option value="${source.sourceId}">${source.sourceName}</form:option>
								</c:forEach>
					</form:select>
				</div>

				<div class="purchaseDate">
					<label for="inputPurchaseDate" class="label">Purchase date</label>
					<div class="input-group date" id="datepicker">
						<form:input type="text" path="purchaseDate" class="dropdown"
							id="inputPurchaseDate" />
						<span class="input-group-append"> <span
							class="input-group-text bg-light "> <i
								class="fa fa-calendar"></i>
						</span>
						</span>
					</div>
				</div>

				<div>
					<label for="category" class="label">Expense Type</label>

					<form:radiobutton path="category.categoryId" value="9f2a1bcb-f081-48ce-b647-26abcb955b4c"
						class="form-radio" id="category1"></form:radiobutton>
					<label for="category1" class="form-radio-label">Family</label>

					<form:radiobutton path="category.categoryId" value="ed5f1d1d-608d-4d4e-8cba-31ff9cbe15c2"
						class="form-radio" id="category2"></form:radiobutton>
					<label for="category2" class="form-radio-label">Personal</label>

				</div>




				<div class="form-grid-button">
					<button type="submit" class="form-submit-button">Add</button>
				</div>
			</form:form>
		</div>



	</div>



	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script>
		$(function() {
			$('#datepicker').datepicker(

			);
		});
	</script>
</body>
</html>