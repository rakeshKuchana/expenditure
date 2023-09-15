package com.home.expenditure.service;

import java.util.List;

import com.home.expenditure.domain.Item;

public interface ItemService {
	void addItem(Item item);
	List<Item> getItemList();
	void deleteItem(Item item);
	void updateItem(Item item);
}
