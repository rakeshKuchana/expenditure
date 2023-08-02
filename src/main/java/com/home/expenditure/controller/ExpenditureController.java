package com.home.expenditure.controller;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.home.expenditure.domain.Expenditure;
import com.home.expenditure.domain.ExpenditureSearchCommand;
import com.home.expenditure.helper.ExpenseCalculator;
import com.home.expenditure.service.ExpenditureService;
import com.home.expenditure.service.ItemService;
import com.home.expenditure.service.SourceService;
import com.home.expenditure.util.DateUtil;

@Controller
public class ExpenditureController {

	@Autowired
	private SourceService sourceService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private ExpenditureService expenditureService;

	@GetMapping({ "", "home" })
	public String home(Model model) {
		List<Expenditure> currentMonthExpenditureList = expenditureService.getExpenditureListForCurrentMonth();

		double currentMonthTotalExpense = ExpenseCalculator.getTotalAmount(currentMonthExpenditureList, null);

		double currentMonthFamilyExpense = ExpenseCalculator.getTotalAmount(currentMonthExpenditureList, "Family");

		double currentMonthPersonalExpense = ExpenseCalculator.getTotalAmount(currentMonthExpenditureList, "Personal");

		DecimalFormat df = new DecimalFormat("#,##,###.00");
		String currentMonthTotalExpenseInRupees = df.format(currentMonthTotalExpense);
		String currentMonthFamilyExpenseInRupees = df.format(currentMonthFamilyExpense);
		String currentMonthPersonalExpenseInRupees = df.format(currentMonthPersonalExpense);

		model.addAttribute("currentMonthExpenditureList", currentMonthExpenditureList);
		model.addAttribute("currentMonthTotalExpenseInRupees", currentMonthTotalExpenseInRupees);
		model.addAttribute("currentMonthFamilyExpenseInRupees", currentMonthFamilyExpenseInRupees);
		model.addAttribute("currentMonthPersonalExpenseInRupees", currentMonthPersonalExpenseInRupees);

		model.addAttribute("sourceList", sourceService.getSourceList());
		model.addAttribute("itemList", itemService.getItemList());

		Expenditure expenditure = new Expenditure();
		expenditure.setPurchaseDate(DateUtil.getCurrentDateString("MM/dd/yyyy"));
		model.addAttribute("expenditure", expenditure);
		return "home";
	}

	@GetMapping("/addexpenditure")
	public String addExpenditure(Model model) {

		model.addAttribute("sourceList", sourceService.getSourceList());
		model.addAttribute("itemList", itemService.getItemList());
		Expenditure exp = new Expenditure();
		exp.setPurchaseDate(DateUtil.getCurrentDateString("MM/dd/yyyy"));
		model.addAttribute("expenditure", exp);
		return "addexpenditure";
	}

	@PostMapping("/add")
	public String add(@ModelAttribute("expenditure") Expenditure expenditure, Model model) {

		expenditureService.addExpenditure(expenditure);

		List<Expenditure> currentMonthExpenditureList = expenditureService.getExpenditureListForCurrentMonth();

		double currentMonthTotalExpense = ExpenseCalculator.getTotalAmount(currentMonthExpenditureList, null);

		double currentMonthFamilyExpense = ExpenseCalculator.getTotalAmount(currentMonthExpenditureList, "Family");

		double currentMonthPersonalExpense = ExpenseCalculator.getTotalAmount(currentMonthExpenditureList, "Personal");

		DecimalFormat df = new DecimalFormat("#,##,###.00");
		String currentMonthTotalExpenseInRupees = df.format(currentMonthTotalExpense);
		String currentMonthFamilyExpenseInRupees = df.format(currentMonthFamilyExpense);
		String currentMonthPersonalExpenseInRupees = df.format(currentMonthPersonalExpense);

		model.addAttribute("currentMonthExpenditureList", currentMonthExpenditureList);
		model.addAttribute("currentMonthTotalExpenseInRupees", currentMonthTotalExpenseInRupees);
		model.addAttribute("currentMonthFamilyExpenseInRupees", currentMonthFamilyExpenseInRupees);
		model.addAttribute("currentMonthPersonalExpenseInRupees", currentMonthPersonalExpenseInRupees);

		model.addAttribute("sourceList", sourceService.getSourceList());
		model.addAttribute("itemList", itemService.getItemList());

		Expenditure exp = new Expenditure();
		exp.setPurchaseDate(DateUtil.getCurrentDateString("MM/dd/yyyy"));
		model.addAttribute("expenditure", exp);

		return "home";
	}

	@PostMapping("/addexpenditure")
	public String addExpenditure(@ModelAttribute("expenditure") Expenditure expenditure, Model model) {

		expenditureService.addExpenditure(expenditure);
		List<Expenditure> currentMonthExpenditureList = expenditureService.getExpenditureListForCurrentMonth();

		double currentMonthTotalExpense = ExpenseCalculator.getTotalAmount(currentMonthExpenditureList, null);

		double currentMonthFamilyExpense = ExpenseCalculator.getTotalAmount(currentMonthExpenditureList, "Family");

		double currentMonthPersonalExpense = ExpenseCalculator.getTotalAmount(currentMonthExpenditureList, "Personal");

		DecimalFormat df = new DecimalFormat("#,##,###.00");
		String currentMonthTotalExpenseInRupees = df.format(currentMonthTotalExpense);
		String currentMonthFamilyExpenseInRupees = df.format(currentMonthFamilyExpense);
		String currentMonthPersonalExpenseInRupees = df.format(currentMonthPersonalExpense);

		model.addAttribute("currentMonthExpenditureList", currentMonthExpenditureList);
		model.addAttribute("currentMonthTotalExpenseInRupees", currentMonthTotalExpenseInRupees);
		model.addAttribute("currentMonthFamilyExpenseInRupees", currentMonthFamilyExpenseInRupees);
		model.addAttribute("currentMonthPersonalExpenseInRupees", currentMonthPersonalExpenseInRupees);

		model.addAttribute("sourceList", sourceService.getSourceList());
		model.addAttribute("itemList", itemService.getItemList());

		Expenditure exp = new Expenditure();
		exp.setPurchaseDate(DateUtil.getCurrentDateString("MM/dd/yyyy"));
		model.addAttribute("expenditure", exp);
		return "home";
	}

	@GetMapping("/viewexpenditure")
	public String viewExpenditure(Model model) {
		ExpenditureSearchCommand expenditureSearchCommand = new ExpenditureSearchCommand();
		expenditureSearchCommand.setStartDate(DateUtil.getCurrentDateString("MM/dd/yyyy"));
		expenditureSearchCommand.setEndDate(DateUtil.getCurrentDateString("MM/dd/yyyy"));
		
		model.addAttribute("expenditureSearchCommand", expenditureSearchCommand);

		return "viewexpenditure";
	}

	@PostMapping("/search")
	public String viewExpenditure(
			@ModelAttribute("expenditureSearchCommand") ExpenditureSearchCommand expenditureSearchCommand,
			Model model) {
		List<Expenditure> expenditureList = expenditureService.getExpenditureList(expenditureSearchCommand);
		double totalAmount = expenditureList.stream().map(expenditure -> expenditure.getAmount()).reduce(0.0, (a, b) -> a + b );
		
		DecimalFormat df = new DecimalFormat("#,##,###.00");
		model.addAttribute("totalAmount", df.format(totalAmount));
		
		
		model.addAttribute("expenditureList", expenditureList);
		model.addAttribute("search", true);
		return "viewexpenditure";
	}

}
