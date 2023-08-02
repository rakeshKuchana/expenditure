package com.home.expenditure.helper;

import java.util.List;

import com.home.expenditure.domain.Expenditure;

public class ExpenseCalculator {

	public static double getTotalAmount(List<Expenditure> expenditureList, String category) {

		double totalAmount = 0;

		if (category != null && !category.isEmpty()) {
			totalAmount = expenditureList.stream()
					.filter(list -> list.getCategory().getCategoryName().equalsIgnoreCase(category))
					.map(fList -> fList.getAmount()).reduce(0.0, (a, b) -> a + b);
		} else {
			totalAmount = expenditureList.stream().map(list -> list.getAmount()).reduce(0.0, (a, b) -> a + b);
		}

		return totalAmount;
	}

}
