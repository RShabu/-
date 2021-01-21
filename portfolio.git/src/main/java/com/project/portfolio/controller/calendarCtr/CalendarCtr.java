package com.project.portfolio.controller.calendarCtr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.portfolio.model.CalendarVO;
import com.project.portfolio.service.CalendarSrv;


@Controller
@RequestMapping("/calendar")
public class CalendarCtr {
	
	@Autowired
	CalendarSrv cSrv;

	@RequestMapping("/grp_calendar_main")
	public String getCalendarHome() {
		return "grp_calendar/grp_calendar_main";
	}
	
	@RequestMapping("/grp_calendar_add")
	@ResponseBody
	public void setCal(@ModelAttribute CalendarVO cvo) {
		cSrv.setCal(cvo);
	}
	
	@RequestMapping("/grp_calendar_list")
	@ResponseBody
	public List<CalendarVO> getCal() {
		List<CalendarVO> list = cSrv.getCal();
		
		return list;
	}
	
}














