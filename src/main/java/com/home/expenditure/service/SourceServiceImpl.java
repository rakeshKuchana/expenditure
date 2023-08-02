package com.home.expenditure.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.home.expenditure.dao.SourceDao;
import com.home.expenditure.domain.Source;

@Service
public class SourceServiceImpl implements SourceService {

	private SourceDao sourceDao;

	@Autowired
	public SourceServiceImpl(SourceDao sourceDao) {
		this.sourceDao = sourceDao;
	}

	@Override
	public List<Source> getSourceList() {
		return sourceDao.getSourceList();
	}

	@Override
	public void addSource(Source source) {
		sourceDao.save(source);

	}

}
