package com.project.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.model.BoardVO;
import com.project.portfolio.model.EmployeeVO;
import com.project.portfolio.repository.EmployeeDao;


@Service
public class EmployeeSrv {

	@Autowired
	EmployeeDao eDao;
	
	public List<EmployeeVO> getEmpList(int start, int end, String searchOpt, String words) {
		return eDao.getEmpList(start, end, searchOpt, words);
	}
	
	public EmployeeVO getEmployeeOne(String sessionNum) {
		return eDao.getEmployeeOne(sessionNum);
	}
	
	public EmployeeVO getEmpOne(int empID) {
		return eDao.getEmpOne(empID);
	}
	
	public int getEmpCount(String searchOpt, String words) {
		return eDao.getEmpCount(searchOpt, words);
	}
	
}
