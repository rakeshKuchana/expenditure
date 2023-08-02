package com.home.expenditure.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.expenditure.dao.ItemDao;
import com.home.expenditure.domain.Item;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDao itemDao;

	@Override
	public void addItem(Item item) {
		itemDao.save(item);
	}

	public List<Item> getItemList() {
		return itemDao.getItemList(); 
	}

}
