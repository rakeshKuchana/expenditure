package com.home.expenditure.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.home.expenditure.domain.Source;

@Repository
public class SourceDaoImpl implements SourceDao {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public SourceDaoImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}



	@Override
	public List<Source> getSourceList() {
		String sql = "select * from source order by source_name";
		
		List<Source> sourceList = jdbcTemplate.query(sql, new RowMapper<Source>() {

			@Override
			public Source mapRow(ResultSet rs, int rowNum) throws SQLException {
				
				Source source = new Source();
			    source.setSourceId(rs.getString("SOURCE_ID"));
			    source.setSourceName(rs.getString("SOURCE_NAME"));
			    source.setSourceAddress(rs.getString("SOURCE_ADDRESS"));
				return source;
			}
		});
		
		return sourceList;
		
		
	}



	@Override
	public void save(Source source) {
		
		String sql = "insert into source values (?, ?, ?, sysdate)";
		
		jdbcTemplate.update(sql, new Object[] {UUID.randomUUID().toString(), source.getSourceName(), source.getSourceAddress()});
		
	}

}
