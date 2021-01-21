package com.project.portfolio.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.portfolio.model.BoardVO;
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
	
	public EmployeeVO getEmployeeOne(String sessionNum) {
		return sql.selectOne("employee.getEmployeeOne", sessionNum);
	}
	
	public EmployeeVO getEmpOne(int empID) {
		return sql.selectOne("employee.getEmpOne", empID);
	}
	
	//dao -> map
	public int getEmpCount(String searchOpt, String words) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sql.selectOne("employee.getEmpCount", map);
	}

	
}











