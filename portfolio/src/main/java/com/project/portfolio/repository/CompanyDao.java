package com.project.portfolio.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.portfolio.model.CompanyVO;

@Repository
public class CompanyDao {
	
	@Autowired
	SqlSession sql;
	
	public CompanyVO getCompany() {
		return sql.selectOne("company.getCompany");
	}
	
	public void setCompany(CompanyVO cvo) {
		sql.update("company.setCompany", cvo);
	}
}
