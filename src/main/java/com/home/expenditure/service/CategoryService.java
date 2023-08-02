package com.home.expenditure.service;

import java.util.List;

import com.home.expenditure.domain.Category;

public interface CategoryService {
	List<Category> getCategoryList();
	List<Category> getCategoryList(String categoryType);
}
