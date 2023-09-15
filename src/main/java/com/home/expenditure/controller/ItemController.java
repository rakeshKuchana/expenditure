package com.home.expenditure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.home.expenditure.domain.Item;
import com.home.expenditure.service.CategoryService;
import com.home.expenditure.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;
	@Autowired
	private CategoryService categoryService;

	@GetMapping("/additem")
	public String addItem(Model model) {
		reset(model);
		return "addItem";
	}

	@PostMapping("/additem")
	public String addItem(@ModelAttribute("item") Item item, Model model) {
		itemService.addItem(item);
		reset(model);
		return "addItem";	
	}
	
	@PostMapping("/updateitem")
	public String updateItem(@ModelAttribute("item") Item item, Model model) {
		itemService.updateItem(item);
		reset(model);
		return "addItem";
	}
	
	@PostMapping("/deleteitem")
	public String deleteItem(@ModelAttribute("item") Item item, Model model) {
		itemService.deleteItem(item);
		reset(model);
		return "addItem";
	}

	private void reset(Model model) {
		model.addAttribute("item", new Item());
		model.addAttribute("itemList", itemService.getItemList());
		model.addAttribute("itemTypeCategoryList", categoryService.getCategoryList("Item"));
	}

}
