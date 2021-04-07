package com.project.portfolio.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.portfolio.model.BoardVO;
import com.project.portfolio.model.BuseoVO;
import com.project.portfolio.model.EmployeeVO;

@Repository
public class EmployeeDao {
	
	@Autowired
	SqlSession sql;
	
	public List<EmployeeVO> getEmpList(int start, int end, String searchOpt, String words) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		map.put("start", start);
		map.put("end", end);
		return sql.selectList("employee.getEmpList", map);
	}
	
	public EmployeeVO getEmpOne(EmployeeVO evo) {
		return sql.selectOne("employee.getEmpOne", evo);
	}
	
	public EmployeeVO getEmpOthersOne(EmployeeVO evo) {
		return sql.selectOne("employee.getEmpOthersOne", evo);
	}
	public EmployeeVO getEmpOthersOneTest(EmployeeVO evo) {
		return sql.selectOne("employee.getEmpOthersOneTest", evo);
	}
	public BuseoVO getEmpBuseo(String string) {
		return sql.selectOne("employee.getEmpBuseo", string);
	}
	
	public int getEmpCount(String searchOpt, String words) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sql.selectOne("employee.getEmpCount", map);
	}

	public void setEmpHeadChange(HashMap<String, String> map) {
		sql.update("employee.setEmpHeadChange", map);
	}
	
	public void setEmpAuthChange(HashMap<String, String> map) {
		sql.update("employee.setEmpAuthChange", map);
	}
	
	public void setEmpConfirmChange(HashMap<String, String> map) {
		sql.update("employee.setEmpConfirmChange", map);
	}
	
	public void setEmpDeleteOne(String empNum) {
		sql.delete("employee.setEmpDeleteOne", empNum);
	}
	
	public void setEmpDeleteAll(int empID) {
		sql.delete("employee.setEmpDeleteAll", empID);
	}
	
	public int setEmpModify(EmployeeVO evo) {
		return sql.update("employee.setEmpModify", evo);
	}

	
}











