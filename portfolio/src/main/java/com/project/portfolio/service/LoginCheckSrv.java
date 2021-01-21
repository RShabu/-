package com.project.portfolio.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.model.EmployeeVO;
import com.project.portfolio.repository.LoginCheckDao;

@Service
public class LoginCheckSrv {
	
	@Autowired
	LoginCheckDao loginCheckDao;

	public EmployeeVO loginCheck(EmployeeVO evo, HttpSession httpSession) {
		EmployeeVO result = loginCheckDao.loginCheck(evo);
		
		if( result != null ) {
			httpSession.setAttribute("empBuseoCode", result.getEmpBuseoCode());
			httpSession.setAttribute("empBuseoName", result.getEmpBuseoName());
			
			httpSession.setAttribute("empGradeCode", result.getEmpGradeCode());
			httpSession.setAttribute("empGradeName", result.getEmpGradeName());
			
			httpSession.setAttribute("empNum", result.getEmpNum());
			httpSession.setAttribute("empName", result.getEmpName());
			httpSession.setAttribute("empConfirm", result.getEmpConfirm());
			httpSession.setAttribute("empAuth", result.getEmpAuth());
		}
		
		return result;
	}

	public void logout(HttpSession httpSession) {
		httpSession.invalidate();		
	}
}
