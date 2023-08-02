package com.home.expenditure.dao;

import java.util.List;

import com.home.expenditure.domain.Expenditure;
import com.home.expenditure.domain.ExpenditureSearchCommand;

public interface ExpenditureDao {
	void save(Expenditure expenditure);
	double getExpenditureTotalAmount(ExpenditureSearchCommand expenditureSearchCommand);
	List<Expenditure> getExpenditureList(ExpenditureSearchCommand expenditureSearchCommand);
}
