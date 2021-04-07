package com.project.portfolio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.portfolio.model.ArticleVO;
import com.project.portfolio.model.BoardVO;
import com.project.portfolio.service.ArticleSrv;

@Controller
@RequestMapping("admin")
public class AdminCtr {
	
	@Autowired
	ArticleSrv aSrv;
	
	@RequestMapping("/grp_admin_main")
	public String grpAdminMain() {
		return "grp_admin/grp_admin_main";
	}
	/*
	 * @RequestMapping(value = "/grp_admin_main", method = RequestMethod.GET) public
	 * ModelAndView grpAdminMain(
	 * 
	 * @RequestParam(defaultValue = "") String words,
	 * 
	 * @RequestParam(defaultValue = "subject") String searchOpt,
	 * 
	 * @RequestParam(defaultValue = "1") int curPage,
	 * 
	 * @RequestParam String boardCode) { ModelAndView mav = new ModelAndView();
	 * List<ArticleVO> vo = aSrv.getAdminArticle(words, searchOpt, boardCode);
	 * mav.addObject("article", vo); mav.addObject("boardCode", boardCode);
	 * mav.setViewName("admin/grp_admin_main"); return mav; }
	 */
}
