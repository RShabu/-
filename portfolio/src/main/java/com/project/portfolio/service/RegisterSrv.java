package com.project.portfolio.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.model.BuseoVO;
import com.project.portfolio.model.EmployeeVO;
import com.project.portfolio.model.GradeVO;
import com.project.portfolio.repository.RegisterDao;

@Service
public class RegisterSrv {

	@Autowired
	RegisterDao RDao;
	
	public void setEmpRegister(EmployeeVO evo) {
		RDao.setEmpRegister(evo);
	}

	public void setEmpRegisterOthers(EmployeeVO evo) {
		RDao.setEmpRegisterOthers(evo);
	}

	public EmployeeVO getEmpRegisterOthers(String sessionNum) {
		return RDao.getEmpRegisterOthers(sessionNum);
	}
	
	public List<BuseoVO> getBuseoList() {
		return RDao.getBuseoList();
	}
	
	public List<GradeVO> getGradeList() {
		return RDao.getGradeList();
	}
	
	public void setSession(EmployeeVO evo, HttpSession session) {
		EmployeeVO vo = RDao.getEmpInfo(evo);
		
		if( vo != null ) {
			session.setAttribute("empBuseoName", vo.getEmpBuseoName());
			session.setAttribute("empGradeName", vo.getEmpGradeName());
			
			session.setAttribute("empNum", vo.getEmpNum());
			session.setAttribute("empName", vo.getEmpName());
			session.setAttribute("empAuth", vo.getEmpAuth());
			session.setAttribute("empConfirm", vo.getEmpConfirm());
		}
	}
	
	public int getEmpNumCheck(EmployeeVO evo) {
		return RDao.getEmpNumCheck(evo);
	}
	
	public EmployeeVO getEmpInfo(EmployeeVO evo) {
		return RDao.getEmpInfo(evo);
	}

}
