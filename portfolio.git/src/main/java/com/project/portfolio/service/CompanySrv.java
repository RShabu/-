package com.project.portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.model.CompanyVO;
import com.project.portfolio.repository.CompanyDao;


@Service
public class CompanySrv {
	
	@Autowired
	CompanyDao comDao;
	
	public CompanyVO getCompany() {
		return comDao.getCompany();
	}
	
	public void setCompany(CompanyVO cvo) {
		comDao.setCompany(cvo);
	}
}
