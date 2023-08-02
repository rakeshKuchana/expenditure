package com.home.expenditure.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.expenditure.dao.CategoryDao;
import com.home.expenditure.domain.Category;

@Service
public class CategoryServiceImpl implements CategoryService, InitializingBean {

	private List<Category> categoryList;
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public List<Category> getCategoryList() {
		return categoryList;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		categoryList = categoryDao.getCategoryList();
	}

	@Override
	public List<Category> getCategoryList(String categoryType) {
		return categoryList.stream().filter(category -> category.getCategoryType().equals(categoryType))
				.collect(Collectors.toList());

	}

}
