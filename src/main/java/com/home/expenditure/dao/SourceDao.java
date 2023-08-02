package com.home.expenditure.dao;

import java.util.List;

import com.home.expenditure.domain.Source;

public interface SourceDao {
	List<Source> getSourceList();
	void save(Source source);
}
