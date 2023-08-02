package com.home.expenditure.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.home.expenditure.domain.Category;
import com.home.expenditure.domain.Item;

@Repository
public class ItemDaoImpl implements ItemDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public ItemDaoImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public void save(Item item) {

		String sql = "insert into item values (?, ?, ?, sysdate)";

		String itemId = UUID.randomUUID().toString();

		jdbcTemplate.update(sql, new Object[] { itemId, item.getItemName(), item.getCategory().getCategoryId() });

		item.setItemId(itemId);

	}

	@Override
	public List<Item> getItemList() {

		String sql = "select * from item order by item_name";

		List<Item> list = jdbcTemplate.query(sql, new RowMapper<Item>() {

			@Override
			public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
				Item item = new Item();

				item.setItemId(rs.getString("ITEM_ID"));
				item.setItemName(rs.getString("ITEM_NAME"));
				Category category = new Category();
				category.setCategoryId(rs.getString("CATEGORY_ID"));
				item.setCategory(category);
				return item;
			}

		});
		return list;
	}

}
