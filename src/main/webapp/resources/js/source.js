var addExpenseModalClose = document.getElementById("add-expense-modal-close");
var addExpenseModal = document.getElementById("add-expense-modal");

addExpenseModalClose.onclick = function() {
	addExpenseModal.style.display = "none";
}

function editSource(sourceId, sourceName, sourceDescription) {
	document.getElementById("modalInputSource").setAttribute("value", sourceName);
	document.getElementById("modalInputAddress").setAttribute("value", sourceDescription);
	document.getElementById("modalInputSourceId").setAttribute("value", sourceId);
	addExpenseModal.style.display = "block";
}