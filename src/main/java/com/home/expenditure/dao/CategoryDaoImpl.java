package com.home.expenditure.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.home.expenditure.domain.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public CategoryDaoImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	

	@Override
	public List<Category> getCategoryList() {
		
		String sql = "select * from category";
		
		List<Category> list = jdbcTemplate.query(sql, new RowMapper<Category>() {

			@Override
			public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
				Category category = new Category();
				
				category.setCategoryId(rs.getString("CATEGORY_ID"));
				category.setCategoryName(rs.getString("CATEGORY_NAME"));
				category.setCategoryDescription(rs.getString("CATEGORY_DESCRIPTION"));
				category.setCategoryType(rs.getString("CATEGORY_TYPE"));
				
				
				return category;
			}
			
		});
		
		return list;
	}

}
