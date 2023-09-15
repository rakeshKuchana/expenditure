var addExpenseModal = document.getElementById("add-expense-modal");
var cancelButton = document.getElementById("cancel-button");
var dateList = document.getElementsByClassName("day");

const weekday = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

for (var i = 0; i < dateList.length; i++) {
	var dateString = dateList[i].innerHTML;
	var date = new Date(Date.parse(dateString, "date-month-year"));
	dateList[i].innerHTML = date.getDate() + " " + weekday[date.getDay()];
}

window.onclick = function(event) {

	if (event.target == familyModal) {
		familyModal.style.display = "none";

	}

	if (event.target == personalModal) {
		personalModal.style.display = "none";
	}
}

var addExpenseModalClose = document.getElementById("add-expense-modal-close");

addExpenseModalClose.onclick = function() {
	addExpenseModal.style.display = "none";
}

function openAddExpenseModal() {
	document.getElementsByClassName("form-container")[0].setAttribute("action", "addexpenditure");
	document.getElementsByClassName("form-submit-button")[0].innerHTML = "Add";
	document.getElementById("default-item").innerHTML = "Select Item..";
	document.getElementsByClassName("modal-quantity")[0].setAttribute("value", "0.0");
	document.getElementsByClassName("modal-amount")[0].setAttribute("value", "0.0");
	document.getElementById("default-source").innerHTML = "Select source...";
	const date = new Date();
	const currentYear = date.getFullYear();
	const today = date.getDate();
	const currentMonth = date.getMonth(); 

	
	var month = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
	var day = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15",
	"16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"];
	
	document.getElementsByClassName("modal-purchaseDate")[0].setAttribute("value", month[date.getMonth()]+"/"+day[today]+"/"+currentYear);
	
		document.getElementById("category1").checked = false;
	
		document.getElementById("category2").checked = false;
	
	addExpenseModal.style.display = "block";
}

var cols = document.getElementsByTagName("input");

for (var i = 0; i < cols.length; i++) {
	cols[i].addEventListener("click", function() {
		this.style.boxShadow = "0 0 10px 0 #888";

	});

	cols[i].addEventListener("blur", function() {

		this.style.boxShadow = "none";

	});
}

var selects = document.getElementsByTagName("select");

for (var i = 0; i < selects.length; i++) {
	selects[i].addEventListener("click", function() {

		this.style.boxShadow = "0 0 10px 0 #888";

	});

	selects[i].addEventListener("blur", function() {

		this.style.boxShadow = "none";

	});
}

$(function() {
	$('#datepicker').datepicker();
});


function showCurrentMonthFamilyExpenses() {
	document.getElementById("family-expenses").style.display = "block";
	document.getElementById("personal-expenses").style.display = "none";
	document.getElementById("current-month-expenses").style.display = "none";

}

function showCurrentMonthPersonalExpenses() {
	document.getElementById("family-expenses").style.display = "none";
	document.getElementById("personal-expenses").style.display = "block";
	document.getElementById("current-month-expenses").style.display = "none";
}


function editExpense(expenditureId, itemName, itemId, quantity, amount, purchaseDate, sourceName,sourceId, categoryName) {
	document.getElementsByClassName("form-container")[0].setAttribute("action", "updateexpenditure");
	document.getElementsByClassName("form-submit-button")[0].innerHTML = "Update";
	document.getElementById("default-item").innerHTML = itemName;
	document.getElementById("default-item").setAttribute("value", itemId);
	document.getElementsByClassName("modal-quantity")[0].setAttribute("value", quantity);
	document.getElementsByClassName("modal-amount")[0].setAttribute("value", amount);
	document.getElementById("default-source").innerHTML = sourceName;
	document.getElementById("default-source").setAttribute("value", sourceId);
	document.getElementsByClassName("modal-purchaseDate")[0].setAttribute("value", purchaseDate);
	if (categoryName === 'Family') {
		document.getElementById("category1").checked = true;
	} else {
		document.getElementById("category2").checked = true;
	}
	document.getElementById("modalInputExpenditureId").setAttribute("value",expenditureId);

	addExpenseModal.style.display = "block";
}


