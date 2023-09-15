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

		StringBuilder sql = new StringBuilder();
		//@formatter:off
		sql.append(" SELECT ")
		   .append("     i.item_id, ")
		   .append("     i.item_name, ")
		   .append("     c.category_id, ")
		   .append("     c.category_name ")
		   .append(" FROM ")
		   .append("     item     i, ")
		   .append("     category c ")
		   .append(" WHERE ")
		   .append("         i.category_id = c.category_id ")
		   .append("     AND c.category_type = 'Item' ")
		   .append(" ORDER BY ")
		   .append("     i.item_name ");
		 //@formatter:on

		List<Item> list = jdbcTemplate.query(sql.toString(), new RowMapper<Item>() {

			@Override
			public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
				Item item = new Item();

				item.setItemId(rs.getString("ITEM_ID"));
				item.setItemName(rs.getString("ITEM_NAME"));
				Category category = new Category();
				category.setCategoryId(rs.getString("CATEGORY_ID"));
				category.setCategoryName(rs.getString("CATEGORY_NAME"));
				item.setCategory(category);
				return item;
			}

		});
		return list;
	}

	@Override
	public void delete(String itemId) {

		String sql = "delete from item where item_id = ?";

		jdbcTemplate.update(sql, new Object[] { itemId });

	}

	@Override
	public void update(Item item) {

		String sql = "update item set item_name = ?, category_id = ? where item_id = ?";

		jdbcTemplate.update(sql,
				new Object[] { item.getItemName(), item.getCategory().getCategoryId(), item.getItemId() });

	}

}
