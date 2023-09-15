package com.home.expenditure.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.expenditure.dao.ExpenditureDao;
import com.home.expenditure.domain.Expenditure;
import com.home.expenditure.domain.ExpenditureSearchCommand;

@Service
public class ExpenditureServiceImpl implements ExpenditureService {

	@Autowired
	private ExpenditureDao expenditureDao;

	@Override
	public void addExpenditure(Expenditure expenditure) {
		expenditureDao.save(expenditure);

	}

	@Override
	public List<Expenditure> getExpenditureList(ExpenditureSearchCommand expenditureSearchCommand) {
		return expenditureDao.getExpenditureList(expenditureSearchCommand);
	}

	@Override
	public List<Expenditure> getExpenditureListForCurrentMonth() {
		ExpenditureSearchCommand expenditureSearchCommand = new ExpenditureSearchCommand();
		LocalDate endDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		String formattedEndDate = formatter.format(endDate);

		String formattedStartDate = endDate.getMonthValue() + "/01/" + endDate.getYear();

		expenditureSearchCommand.setStartDate(formattedStartDate);
		expenditureSearchCommand.setEndDate(formattedEndDate);

		return expenditureDao.getExpenditureList(expenditureSearchCommand);
	}

	@Override
	public void updateExpenditure(Expenditure expenditure) {
		expenditureDao.update(expenditure);
		
	}

}
