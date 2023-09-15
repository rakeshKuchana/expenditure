<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/nav-bar.css" />" />
</head>
<body>
	<div class="nav-bar">
		<div class="logo">Expense Tracker</div>
		<div class="nav-item"><a href="addsource">Source</a></div>
		<div class="nav-item"><a href="additem">Item</a></div>
		<div class="nav-item"><a href="viewexpenditure">View Expenses</a></div>
		<div class="nav-item"><a href="home">Home</a></div>
	</div>
</body>
</html>