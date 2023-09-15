package com.home.expenditure.service;

import java.util.List;

import com.home.expenditure.domain.Expenditure;
import com.home.expenditure.domain.ExpenditureSearchCommand;

public interface ExpenditureService {
	
	void addExpenditure(Expenditure expenditure);
	List<Expenditure> getExpenditureList(ExpenditureSearchCommand expenditureSearchCommand);
	List<Expenditure> getExpenditureListForCurrentMonth();
	void updateExpenditure(Expenditure expenditure);
}
