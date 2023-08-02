package com.home.expenditure.helper;

import java.util.List;
import java.util.stream.Collectors;

import com.home.expenditure.domain.Expenditure;

public class RecentExpensesExtractor {
	
	public static List<Expenditure> getRecentExpenses(List<Expenditure> expenditureList, int limit) {
		return expenditureList.stream().limit(limit).collect(Collectors.toList());
	}

}
