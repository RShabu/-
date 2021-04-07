package com.project.portfolio.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.model.BoardVO;
import com.project.portfolio.model.BuseoVO;
import com.project.portfolio.model.EmployeeVO;
import com.project.portfolio.repository.EmployeeDao;


@Service
public class EmployeeSrv {

	@Autowired
	EmployeeDao eDao;
	
	public List<EmployeeVO> getEmpList(int start, int end, String searchOpt, String words) {
		return eDao.getEmpList(start, end, searchOpt, words);
	}
	
	public EmployeeVO getEmpOne(EmployeeVO evo) {
		return eDao.getEmpOne(evo);
	}
	
	public EmployeeVO getEmpOthersOne(EmployeeVO evo) {
		return eDao.getEmpOthersOne(evo);
	}
	
	public EmployeeVO getEmpOthersOneTest(EmployeeVO evo) {
		return eDao.getEmpOthersOneTest(evo);
	}
	
	public BuseoVO getEmpBuseo(String string) {
		return eDao.getEmpBuseo(string);
	}
	
	public int getEmpCount(String searchOpt, String words) {
		return eDao.getEmpCount(searchOpt, words);
	}
	
	public void setEmpHeadChange(String headType, String empNum) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("headType", headType);
		map.put("empNum", empNum);
		eDao.setEmpHeadChange(map);
	}
	
	public void setEmpAuthChange(String auth, String empNum) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("auth", auth);
		map.put("empNum", empNum);
		eDao.setEmpAuthChange(map);
	}

	public void setEmpConfirmChange(String confirmType, String empNum) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("confirmType", confirmType);
		map.put("empNum", empNum);
		eDao.setEmpConfirmChange(map);
	}

	public void setEmpDeleteOne(String empNum) {
		eDao.setEmpDeleteOne(empNum);
	}

	public void setEmpDeleteAll(int empID) {
		eDao.setEmpDeleteAll(empID);
	}
	
	public int setEmpModify(EmployeeVO evo) {
		return eDao.setEmpModify(evo);
	}


}
