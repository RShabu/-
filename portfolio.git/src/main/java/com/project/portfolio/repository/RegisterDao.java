package com.project.portfolio.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.portfolio.model.BuseoVO;
import com.project.portfolio.model.EmployeeVO;
import com.project.portfolio.model.GradeVO;

@Repository
public class RegisterDao {

	@Autowired
	SqlSession sqlsession;
	
	public void setEmpRegister(EmployeeVO evo) {
		sqlsession.insert("register.setEmpRegister", evo);
	}
	
	public void setEmpRegisterOthers(EmployeeVO evo) {
		sqlsession.insert("register.setEmpRegisterOthers", evo);
	}
	
	public EmployeeVO getEmpRegisterOthers(String sessionNum) {
		return sqlsession.selectOne("employee.getEmployeeOne", sessionNum);
	}
	
	public List<BuseoVO> getBuseoList() {
		return sqlsession.selectList("buseo.getBuseoList");
	}
	
	public List<GradeVO> getGradeList() {
		return sqlsession.selectList("grade.getGradeList");
	}

	public int getEmpNumCheck(EmployeeVO evo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("empNum", evo.getEmpNum());
		map.put("empPwd", evo.getEmpPwd());
		return sqlsession.selectOne("register.getEmpNumCheck", map);
	}

	public EmployeeVO getEmpInfo(EmployeeVO evo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("empNum", evo.getEmpNum());
		map.put("empPwd", evo.getEmpPwd());
		return sqlsession.selectOne("register.getEmpInfo", map);
	}
}
