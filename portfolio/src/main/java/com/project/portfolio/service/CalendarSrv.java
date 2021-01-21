package com.project.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.model.CalendarVO;
import com.project.portfolio.repository.CalendarDao;

@Service
public class CalendarSrv {

	@Autowired
	CalendarDao cDao;
	
	public void setCal(CalendarVO cvo) {
		cDao.setCal(cvo);
	}
	
	public List<CalendarVO> getCal() {
		return cDao.getCal();
	}
}
