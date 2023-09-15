function editSource(sourceId, sourceName, sourceDescription) {
	document.getElementById("modalInputSource").setAttribute("value", sourceName);
	document.getElementById("modalInputAddress").setAttribute("value", sourceDescription);
	document.getElementById("modalInputSourceId").setAttribute("value", sourceId);
	addExpenseModal.style.display = "block";
}