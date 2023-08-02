<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view expenditure</title>
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
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/view-expenses.css" />" />
</head>
<body>
	<div class="grid-container">
		<!-- row 1 -->
		<div class="header">
			<jsp:include page="navigation-bar.jsp"></jsp:include>
		</div>
		<!-- row2 -->
		<div class="form">
			<form:form modelAttribute="expenditureSearchCommand"
			action="search" class="form-grid-container">
			
			<div>
				<label for="inputStartDate" class="label">Start date</label>
				<div class="input-group date datepicker" id="datepicker1">
					<form:input type="text" path="startDate" class="text"
						id="inputStartDate" format="dd-MMM-yyyy" />
					<span class="input-group-append"> <span
						class="input-group-text bg-light d-block"> <i
							class="fa fa-calendar"></i>
					</span>
					</span>
				</div>
			</div>
			
			<div>
				<label for="inputEndDate" class="label">End date</label>
				<div class="input-group date datepicker" id="datepicker2">
					<form:input type="text" path="endDate" class="text"
						id="inputEndDate" />
					<span class="input-group-append"> <span
						class="input-group-text bg-light d-block"> <i
							class="fa fa-calendar"></i>
					</span>
					</span>
				</div>
			</div>
			<div>
				<label for="inputCategory" class="label">Expense Type</label>

				<form:radiobutton path="category.categoryName" value="Family" class="form-radio"></form:radiobutton>
				<label for="inputCategory" class="form-radio-label">Family</label>

				<form:radiobutton path="category.categoryName" value="Personal" class="form-radio"></form:radiobutton>
				<label for="inputCategory" class="form-radio-label">Personal</label>

			</div>


			<div class="col-12">
				<button type="submit" class="form-submit-button">Search</button>
			</div>

		</form:form>
		</div>

	</div>


	<div class="container" style="margin-top: 30px">
		
		<div style="margin-top: 30px">
			<c:if test="${not empty expenditureList}">


				<h5>Total Amount: ${totalAmount}</h5>
				<div style="margin-top: 30px">
					<table id="expenditureTable" class="display">
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
							<c:forEach var="expenditure" items="${expenditureList}">
								<tr>
									<td>${expenditure.item.itemName}</td>
									<td>${expenditure.quantity}</td>
									<td>${expenditure.amount}</td>
									<td>${expenditure.purchaseDate}</td>
									<td>${expenditure.source.sourceName}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>


				</div>

			</c:if>

			<c:if test="${search && empty expenditureList}">
				<h4 style="text-align: center">No data found</h4>
			</c:if>

		</div>

	</div>

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<!-- <script type="text/javascript" src = "https://code.jquery.com/jquery-3.5.1.js"></script> -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
	<script>
		$(function() {
			$('.datepicker').datepicker();
		});

		$(document).ready(function() {
			$('#expenditureTable').DataTable({
				order : []
			});
		});
	</script>
</body>
</html>