package com.home.expenditure.service;

import java.util.List;

import com.home.expenditure.domain.Source;

public interface SourceService {
	List<Source> getSourceList();
	void addSource(Source source);
	void deleteSource(String sourceId);
	void updateSource(Source source);
}
