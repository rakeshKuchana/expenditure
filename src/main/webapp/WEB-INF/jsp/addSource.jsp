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
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/add-source.css" />" />

<script src="<c:url value="/resources/js/source.js" />" defer></script>
</head>
<body>
	<div class="grid-container">
		<!--row 1 -->
		<div class="header">
			<jsp:include page="navigation-bar.jsp"></jsp:include>
		</div>

		<!-- row2 -->
		<div class="form-container">
			<form:form class="form-grid-container" method="POST"
				modelAttribute="source" action="addsource">

				<div>
					<label for="inputSource" class="label">Source</label>
					<form:input type="text" path="sourceName" class="text"
						id="inputSource" required="required" />
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

		<!-- row3 -->
		<div class="datatable-container">
			<table id="sourceTable" class="display sourceTable">
				<thead>
					<tr>
						<th>Source</th>
						<th>Address</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="source" items="${sourceList}">
						<tr>
							<td>${source.sourceName}</td>
							<td>${source.sourceAddress}</td>
							<td><button
									onclick="editSource('${source.sourceId}','${source.sourceName}', '${source.sourceAddress}' )"
									style="border: none; background: none">
									<span class="fa fa-pencil"></span>
								</button></td>
							<td><form:form method="POST" modelAttribute="source"
									action="deletesource">
									<form:input type="hidden" value="${source.sourceId}"
										path="sourceId"></form:input>
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
				<form:form class="form-grid-container" method="POST"
					modelAttribute="source" action="updatesource">

					<div>
						<label for="inputSource" class="label">Source</label>
						<form:input type="text" path="sourceName" class="text"
							id="modalInputSource" required="required" />
					</div>

					<div>
						<label for="inputAddress" class="label">Address</label>
						<form:input type="text" path="sourceAddress" class="text"
							id="modalInputAddress" />
					</div>
					<form:input type="hidden" path="sourceId" id="modalInputSourceId"/>

					<div class="col-12">
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
			$('.sourceTable').DataTable({
				order : []
			});
		});
	</script>

</body>
</html>