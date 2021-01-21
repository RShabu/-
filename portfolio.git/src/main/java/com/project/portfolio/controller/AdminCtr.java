package com.project.portfolio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminCtr {
	
	@RequestMapping("/grp_admin_main")
	public String grpAdminMain() {
		return "grp_admin/grp_admin_main";
	}
}
