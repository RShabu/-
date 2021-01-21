package com.project.portfolio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.portfolio.model.CompanyVO;
import com.project.portfolio.service.CompanySrv;

@Controller
@RequestMapping("/company")
public class CompanyCtr {

	@Autowired
	CompanySrv comSrv;
	
	@RequestMapping(value = "grp_company_main", method = RequestMethod.GET)
	public String getCompany() {
		return "grp_company/grp_company_main";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	@ResponseBody
	public CompanyVO getCompanyInfo() {
		CompanyVO cvo = comSrv.getCompany();
		return cvo;
	}
	
	@RequestMapping(value = "/grp_company", method = RequestMethod.POST)
	public String grpCompany(@ModelAttribute CompanyVO cvo) {
		comSrv.setCompany(cvo);
		return "grp_company/grp_company_main";
	}
}
