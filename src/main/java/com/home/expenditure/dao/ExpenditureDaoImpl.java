package com.home.expenditure.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.home.expenditure.domain.Category;
import com.home.expenditure.domain.Expenditure;
import com.home.expenditure.domain.ExpenditureSearchCommand;
import com.home.expenditure.domain.Item;
import com.home.expenditure.domain.Source;

@Repository
public class ExpenditureDaoImpl implements ExpenditureDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public ExpenditureDaoImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public void save(Expenditure expenditure) {

		String sql = "insert into expenditure values (?, ?, ?, ?, ?, ?, sysdate, ?)";

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		LocalDate date = LocalDate.parse(expenditure.getPurchaseDate(), formatter);

		jdbcTemplate.update(sql,
				new Object[] { UUID.randomUUID().toString(), expenditure.getItem().getItemId(),
						expenditure.getQuantity(), expenditure.getAmount(), expenditure.getCategory().getCategoryId(),
						date, expenditure.getSource().getSourceId() });

	}

	@Override
	public double getExpenditureTotalAmount(ExpenditureSearchCommand expenditureSearchCommand) {
		StringBuilder sql = new StringBuilder();
		//@formatter:off
		sql.append(" SELECT ")
		   .append("     SUM(e.amount) ")
		   .append(" FROM ")
		   .append("     expenditure e, ")
		   .append("     category    c ")
		   .append(" WHERE ")
		   .append("         e.category_id = c.category_id ")
		   .append("     AND c.category_name = ? ")
		   .append("     AND trunc(e.purchase_date) >= TO_DATE(?, 'mm/dd/yyyy') ")
		   .append("     AND trunc(e.purchase_date) <= TO_DATE(?, 'mm/dd/yyyy') ");
		//@formatter:on

		Object[] params = new Object[] { expenditureSearchCommand.getCategory().getCategoryName(),
				expenditureSearchCommand.getStartDate(), expenditureSearchCommand.getEndDate() };

		Double sum = jdbcTemplate.queryForObject(sql.toString(), params, Double.class);

		if (sum == null) {
			sum = 0.0;
		}
		return sum;
	}

	@Override
	public List<Expenditure> getExpenditureList(ExpenditureSearchCommand expenditureSearchCommand) {
		StringBuilder sql = new StringBuilder();
		//@formatter:off
		sql.append(" SELECT ")
		   .append("     i.item_name, ")
		   .append("     i.item_id, ")
		   .append("     e.quantity, ")
		   .append("     e.amount, ")
		   .append("     to_char(e.purchase_date, 'DD-Mon-YYYY') purchase_date,")
		   .append("     s.source_name, ")
		   .append("     s.source_id, ")
		   .append("     c.category_name, ")
		   .append("     c.category_id, ")
		   .append("     e.expenditure_id ")
		   .append(" FROM ")
		   .append("     expenditure e, ")
		   .append("     category    c, ")
		   .append("     item        i, ")
		   .append("     source      s ")
		   .append(" WHERE ")
		   .append("         e.category_id = c.category_id ")
		   .append("     AND e.item_id = i.item_id ")
		   .append("     AND e.source_id = s.source_id ");
		  if (expenditureSearchCommand.getCategory() != null)
			  sql.append("     AND c.category_name = ? ");
		  sql.append("     AND trunc(e.purchase_date) >= TO_DATE(?, 'mm/dd/yyyy') ")
		   .append("     AND trunc(e.purchase_date) <= TO_DATE(?, 'mm/dd/yyyy') ")
		   .append("     ORDER BY e.purchase_date desc, e.created_date desc ");
		 //@formatter:on

		Object[] params;

		if (expenditureSearchCommand.getCategory() != null) {
			params = new Object[] { expenditureSearchCommand.getCategory().getCategoryName(),
					expenditureSearchCommand.getStartDate(), expenditureSearchCommand.getEndDate() };
		} else {
			params = new Object[] { expenditureSearchCommand.getStartDate(), expenditureSearchCommand.getEndDate() };
		}

		List<Expenditure> list = jdbcTemplate.query(sql.toString(), params, new RowMapper<Expenditure>() {

			@Override
			public Expenditure mapRow(ResultSet rs, int rowNum) throws SQLException {
				Expenditure expenditure = new Expenditure();
				Item item = new Item();
				item.setItemName(rs.getString("ITEM_NAME"));
				item.setItemId(rs.getString("ITEM_ID"));
				expenditure.setItem(item);
				expenditure.setQuantity(rs.getDouble("QUANTITY"));
				expenditure.setAmount(rs.getDouble("AMOUNT"));
				expenditure.setPurchaseDate(rs.getString("PURCHASE_DATE"));
				Source source = new Source();
				source.setSourceId(rs.getString("SOURCE_ID"));
				source.setSourceName(rs.getString("SOURCE_NAME"));
				expenditure.setSource(source);
				Category category = new Category();
				category.setCategoryName(rs.getString("CATEGORY_NAME"));
				category.setCategoryId(rs.getString("CATEGORY_ID"));
				expenditure.setCategory(category);
				expenditure.setExpenditureId(rs.getString("EXPENDITURE_ID"));

				return expenditure;
			}

		});

		return list;
	}

	@Override
	public void update(Expenditure expenditure) {
		
		System.out.println(expenditure.getPurchaseDate());
		
		StringBuilder sql = new StringBuilder();
		//@formatter:off
		sql.append(" UPDATE expenditure ")
		   .append(" SET ")
		   .append("     item_id = ?, ")
		   .append("     quantity = ?, ")
		   .append("     amount = ?, ")
		   .append("     category_id = ?, ")
		   .append("     purchase_date = to_date(?, 'mm/dd/yyyy'), ")
		   .append("     source_id = ? ")
		   .append(" WHERE ")
		   .append("     expenditure_id = ? ");
		 //@formatter:on
		  
		   Object[] params = {expenditure.getItem().getItemId(), expenditure.getQuantity(), expenditure.getAmount(),
				   expenditure.getCategory().getCategoryId(), expenditure.getPurchaseDate(), expenditure.getSource().getSourceId(), expenditure.getExpenditureId()};
		   
	   jdbcTemplate.update(sql.toString(), params);
		
	}

}
