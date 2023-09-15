<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
<script src="<c:url value="/resources/js/home.js" />" defer></script>
<link rel="stylesheet" href="<c:url value="/resources/css/home.css" />" />


</head>
<body>
	<div class="grid-container">
		<!-- row 1 -->
		<div class="header">
			<jsp:include page="navigation-bar.jsp"></jsp:include>
		</div>

		<!-- row 2 -->
		<div class="row2">
			<button onclick="openAddExpenseModal()" class="add-expense-button">Add
				Expense</button>
		</div>
	</div>



	<div class="box" id="total">
		<p>Total Expenses</p>
		<h2>
			<i class="fa fa-rupee" style="font-size: 28px"></i>
			${currentMonthTotalExpenseInRupees}
		</h2>
		<p>This Month</p>
	</div>
	<div class="box" id="family">
		<p>Total Family Expenses</p>
		<h2>
			<i class="fa fa-rupee" style="font-size: 28px"></i>
			${currentMonthFamilyExpenseInRupees}
		</h2>
		<p>This Month</p>
		<button onClick="showCurrentMonthFamilyExpenses()" class="view">View</button>
	</div>
	<div class="box" id="personal">
		<p>Total Personal Expenses</p>
		<h2>
			<i class="fa fa-rupee" style="font-size: 28px"></i>
			${currentMonthPersonalExpenseInRupees}
		</h2>
		<p>This Month</p>
		<button onClick="showCurrentMonthPersonalExpenses()" class="view">View</button>
	</div>

	<div class="my-modal" id="add-expense-modal">
		<div class="my-modal-content" id="add-expense-modal-content">
			<span class="close-icon" id="add-expense-modal-close">&times;</span>

			<div class="form">
				<div class="form">
					<form:form method="POST" modelAttribute="expenditure"
						action="addexpenditure" class="form-container">

						<div>
							<label for="item" class="label">Item</label>
							<form:select path="item.itemId" id="item" class="dropdown"
								required="required">
								<form:option value="" id="default-item">Select item...</form:option>
								<c:forEach var="item" items="${itemList}">
									<form:option value="${item.itemId}">${item.itemName}</form:option>
								</c:forEach>
							</form:select>
						</div>

						<div>
							<label for="quantity" class="label">Quantity</label>
							<form:input type="text" path="quantity" class="text modal-quantity"
								id="quantity" />
						</div>
						<div>
							<label for="amount" class="label">Amount</label>
							<form:input type="text" path="amount" class="text modal-amount" id="amount" />
						</div>
						<div>
							<label for="source" class="label">Source</label>
							<form:select path="source.sourceId" id="source" class="dropdown"
								required="required">
								<form:option value="" id="default-source">Select source...</form:option>
								<c:forEach var="source" items="${sourceList}">
									<form:option value="${source.sourceId}">${source.sourceName}</form:option>
								</c:forEach>
							</form:select>
						</div>

						<div class="purchaseDate">
							<label for="inputPurchaseDate" class="label">Purchase
								date</label>
							<div class="input-group date" id="datepicker">
								<form:input type="text" path="purchaseDate" class="dropdown modal-purchaseDate"
									id="inputPurchaseDate" />
								<span class="input-group-append"> <span
									class="input-group-text bg-light icon-border"> <i
										class="fa fa-calendar"></i>
								</span>
								</span>
							</div>
						</div>

						<div>
							<label for="category" class="label">Expense Type</label>

							<form:radiobutton path="category.categoryId"
								value="9f2a1bcb-f081-48ce-b647-26abcb955b4c" class="form-radio"
								id="category1" required="required"></form:radiobutton>
							<label for="category1" class="form-radio-label">Family</label>

							<form:radiobutton path="category.categoryId"
								value="ed5f1d1d-608d-4d4e-8cba-31ff9cbe15c2" class="form-radio"
								id="category2" required="required"></form:radiobutton>
							<label for="category2" class="form-radio-label">Personal</label>

						</div>
						<form:input type="hidden" path="expenditureId" id="modalInputExpenditureId" />

						<div class="form-grid-button">
							<button type="submit" class="form-submit-button">Add</button>
						</div>
					</form:form>

				</div>
			</div>



		</div>
	</div>

	<div style="margin-top: 500px" id="family-expenses">
		<c:if test="${not empty currentMonthExpenditureList}">


			<h5>Total Amount: ${currentMonthFamilyExpenseInRupees}</h5>
			<div style="margin-top: 30px">
				<table id="expenditureTable" class="display expenditureTable">
					<thead>
						<tr>
							<th>Item</th>
							<th>Quantity</th>
							<th>Amount</th>
							<th>Purchase Date</th>
							<th>Source</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="expenditure"
							items="${currentMonthExpenditureList}">
							<c:if test="${expenditure.category.categoryName eq 'Family'}">
								<tr>
									<td>${expenditure.item.itemName}</td>
									<td>${expenditure.quantity}</td>
									<td>${expenditure.amount}</td>
									<td>${expenditure.purchaseDate}</td>
									<td>${expenditure.source.sourceName}</td>
								</tr>
							</c:if>

						</c:forEach>

					</tbody>
				</table>


			</div>

		</c:if>

		<c:if test="${empty currentMonthExpenditureList}">
			<h4 style="text-align: center">No data found</h4>
		</c:if>

	</div>

	<div style="margin-top: 500px;" id="personal-expenses">
		<c:if test="${not empty currentMonthExpenditureList}">


			<h5>Total Amount: ${currentMonthPersonalExpenseInRupees}</h5>
			<div style="margin-top: 30px">
				<table id="expenditureTable" class="display expenditureTable">
					<thead>
						<tr>
							<th>Item</th>
							<th>Quantity</th>
							<th>Amount</th>
							<th>Purchase Date</th>
							<th>Source</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="expenditure"
							items="${currentMonthExpenditureList}">
							<c:if test="${expenditure.category.categoryName eq 'Personal'}">
								<tr>
									<td>${expenditure.item.itemName}</td>
									<td>${expenditure.quantity}</td>
									<td>${expenditure.amount}</td>
									<td>${expenditure.purchaseDate}</td>
									<td>${expenditure.source.sourceName}</td>
								</tr>
							</c:if>

						</c:forEach>

					</tbody>
				</table>


			</div>

		</c:if>

		<c:if test="${empty currentMonthExpenditureList}">
			<h4 style="text-align: center">No data found</h4>
		</c:if>

	</div>

	<div style="margin-top: 500px" id="current-month-expenses">
		<c:if test="${not empty currentMonthExpenditureList}">


			<h5>Total Amount: ${currentMonthTotalExpenseInRupees}</h5>
			<div style="margin-top: 30px">
				<table id="expenditureTable" class="display expenditureTable">
					<thead>
						<tr>
							<th>Item</th>
							<th>Quantity</th>
							<th>Amount</th>
							<th>Purchase Date</th>
							<th>Source</th>
							<th>Expense Type</th>
							<th>Edit</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="expenditure"
							items="${currentMonthExpenditureList}">
							<tr>
								<td>${expenditure.item.itemName}</td>
								<td>${expenditure.quantity}</td>
								<td>${expenditure.amount}</td>
								<td>${expenditure.purchaseDate}</td>
								<td>${expenditure.source.sourceName}</td>
								<td>${expenditure.category.categoryName}</td>
								<td><button onclick="editExpense('${expenditure.expenditureId}','${expenditure.item.itemName}','${expenditure.item.itemId}','${expenditure.quantity}','${expenditure.amount}','${expenditure.purchaseDate}','${expenditure.source.sourceName}','${expenditure.source.sourceId}','${expenditure.category.categoryName}')"
										style="border: none; background: none">
										<span class="fa fa-pencil"></span>
									</button></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>


			</div>

		</c:if>

	</div>


	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

	<script type="text/javascript"
		src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.expenditureTable').DataTable({
				order : []
			});
		});

		$(function() {
			$('#datepicker').datepicker(

			);
		});
	</script>
</body>
</html>