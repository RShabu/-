package com.project.portfolio.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.portfolio.model.CalendarVO;

@Repository
public class CalendarDao {
	
	@Autowired
	SqlSession sql;
	
	public void setCal(CalendarVO cvo) {
		sql.insert("calendar.setCal", cvo);
	}
	
	public List<CalendarVO> getCal() {
		return sql.selectList("calendar.getCal");
	}
}
