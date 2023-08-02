package com.home.expenditure.dao;

import java.util.List;

import com.home.expenditure.domain.Item;

public interface ItemDao {
	void save(Item item);
	List<Item> getItemList();

}
