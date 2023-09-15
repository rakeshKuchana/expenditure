function editItem(itemId, itemName, categoryName, categoryId) {
	document.getElementById("modalInputItem").setAttribute("value", itemName);
	document.getElementById("modalInputCategory").innerHTML = categoryName;
	document.getElementById("modalInputCategory").setAttribute("value", categoryId);
	document.getElementById("modalInputItemId").setAttribute("value", itemId);
	addExpenseModal.style.display = "block";
}