package com.project.portfolio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.portfolio.model.BoardVO;
import com.project.portfolio.model.EmployeeVO;
import com.project.portfolio.paging.Pager;
import com.project.portfolio.service.BoardSrv;
import com.project.portfolio.service.EmployeeSrv;

@Controller
@RequestMapping("/board")
public class BoardCtr {

	@Autowired
	BoardSrv boardSrv;

	@Autowired
	EmployeeSrv eSrv;
	
	@RequestMapping("/grp_board_main")
	@ResponseBody
	public ModelAndView grpBoardMain(
			@RequestParam(defaultValue = "") String words,
			@RequestParam(defaultValue = "boardCode") String searchOpt,
			@RequestParam(defaultValue = "1") int curPage){

		ModelAndView mav = new ModelAndView();
		
		int count = boardSrv.getBoardCount(searchOpt, words);
		
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardVO> list = boardSrv.getBoardList(start, end, words, searchOpt);
		
		mav.addObject("list", list);
		mav.addObject("words", words);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("count", count);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());
		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("totalPage", pager.getTotPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("selected", pager.getCurPage());

		mav.setViewName("grp_board/grp_board_main");
		
		return mav;
	}


	@RequestMapping(value = "/grp_board_insert", method = RequestMethod.POST)
	@ResponseBody
	public String setBoard(@ModelAttribute BoardVO bvo) {
		boardSrv.setBoard(bvo);
		boardSrv.createArticleTbl(bvo.getBoardCode());
		boardSrv.createCommentTbl(bvo.getBoardCode());
		return "success";
	}
	
	@RequestMapping(value = "/grp_board_delete", method = RequestMethod.POST)
	@ResponseBody
	public String setBoardDelete(@RequestParam String boardCode) {
		boardSrv.setBoardDelete(boardCode);
		System.out.println(boardCode);
		System.out.println("아메리카노" + boardCode + "보드코드");
		return "success";
	}
	
	
}
