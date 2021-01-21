package com.project.portfolio.repository;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.portfolio.model.EmployeeVO;

@Repository
public class LoginCheckDao {

	@Autowired
	SqlSession sql;
	
	public EmployeeVO loginCheck(EmployeeVO evo) {
		return sql.selectOne("login.loginCheck", evo);
	}
	
	public void logout(HttpSession httpSession) {
		
	}
	
}
