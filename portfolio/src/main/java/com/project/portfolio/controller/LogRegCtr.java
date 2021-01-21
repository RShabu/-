package com.project.portfolio.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.portfolio.model.BuseoVO;
import com.project.portfolio.model.CompanyVO;
import com.project.portfolio.model.EmployeeVO;
import com.project.portfolio.model.GradeVO;
import com.project.portfolio.service.CompanySrv;
import com.project.portfolio.service.LoginCheckSrv;
import com.project.portfolio.service.RegisterSrv;

@Controller
public class LogRegCtr {

	@Autowired
	RegisterSrv rSrv;
	
	@Autowired
	CompanySrv cSrv;
	
	@Autowired
	LoginCheckSrv loginCheckSrv;
	
	@RequestMapping("")
	public String Main() {
		return "main";
	}
	
	@RequestMapping(value = "/grp_login", method = RequestMethod.GET)
	public ModelAndView getGrpLogin() {
		CompanyVO cvo = cSrv.getCompany();
		ModelAndView mav = new ModelAndView();
		mav.addObject("comName", cvo.getComName());
		mav.addObject("comSubName", cvo.getComSubName());
		mav.setViewName("grp_login");
		return mav;
	}
	
	@RequestMapping(value = "/grp_login", method = RequestMethod.POST)
	public ModelAndView setLogin(@ModelAttribute EmployeeVO evo, HttpSession session) {
		int result = rSrv.getEmpNumCheck(evo);
		CompanyVO cvo = cSrv.getCompany();
		int auth = cSrv.getCompany().getComAuth();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("comName", cvo.getComName());
		mav.addObject("comSubName", cvo.getComSubName());
		
		String msg = "";
		if( result > 0 ) {
			EmployeeVO vo = rSrv.getEmpInfo(evo);
			if( vo.getEmpAuth() >= auth && vo.getEmpConfirm().equals("Y") ) {
				rSrv.setSession(evo, session);
				mav.setViewName("redirect:/admin/grp_admin_main");
				
			}else if( vo.getEmpAuth() >= auth && vo.getEmpConfirm().equals("Y") ) {
				rSrv.setSession(evo, session);
				mav.setViewName("redirect:/");
				
			}else {
				msg = "접속 권한이 없습니다.\n관리자에게 문의하세요.";
				rSrv.setSession(evo, session);
				mav.addObject("msg", msg);
				mav.setViewName("redirect:/");
			}
			
		}else {
			msg = "등록된 사번이 아닙니다.";
			mav.addObject("msg", msg);
			mav.setViewName("grp_login");	
		}
		System.out.println(msg);
		return mav;
	}
	
	@RequestMapping("/grp_logout")
	@ResponseBody
	public String grpLogout(HttpSession httpSession) {
		loginCheckSrv.logout(httpSession);
		return "success";
	}
	
	@RequestMapping(value = "/grp_buseo", method = RequestMethod.POST)
	@ResponseBody
	public List<BuseoVO> getBuseo() {
		List<BuseoVO> list = rSrv.getBuseoList();
		System.out.println(list);
		return list;
	}
	
	@RequestMapping(value = "/grp_grade", method = RequestMethod.POST)
	@ResponseBody
	public List<GradeVO> getGrade() {
		List<GradeVO> list = rSrv.getGradeList();
		System.out.println(list);
		return list;
	}
}
