var addExpenseModal = document.getElementById("add-expense-modal");
var cancelButton = document.getElementById("cancel-button");
var dateList = document.getElementsByClassName("day");

const weekday = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];

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
	addExpenseModal.style.display = "block";
}

var cols = document.getElementsByTagName("input");

for (var i = 0; i < cols.length; i++) {
	cols[i].addEventListener("click", function(){
		this.style.boxShadow = "0 0 10px 0 #888";
		
	});
	
	cols[i].addEventListener("blur", function(){
		
		this.style.boxShadow = "none";
		
	});
}

var selects = document.getElementsByTagName("select");

for (var i = 0; i < selects.length; i++) {
	selects[i].addEventListener("click", function(){
		
		this.style.boxShadow = "0 0 10px 0 #888";
		
	});
	
	selects[i].addEventListener("blur", function(){
		
		this.style.boxShadow = "none";
		
	});
}

$(function(){
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

