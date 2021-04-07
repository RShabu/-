package com.project.portfolio.controller.boardCtr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.portfolio.model.CommentVO;
import com.project.portfolio.service.CommentSrv;

@Controller
@RequestMapping("/comment")
public class CommentCtr {

	@Autowired
	CommentSrv cSrv;
	
	@RequestMapping("/grp_comment_register")
	@ResponseBody
	public void setComent(@ModelAttribute CommentVO cvo) {
		cSrv.setComment(cvo);
	}
	
	@RequestMapping("/grp_comment_list")
	@ResponseBody
	public Map<String, Object> getCommentList(@ModelAttribute CommentVO cvo) {
		List<CommentVO> list = cSrv.getCommentList(cvo);
		int count = cSrv.getCommentCount(cvo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		
		return map;
	}
	
	@RequestMapping("/grp_comment_delete")
	@ResponseBody
	public void setDelete(@ModelAttribute CommentVO cvo) {
		cSrv.setCommentDelete(cvo);
	}
	
	@RequestMapping("/grp_comment_modify")
	@ResponseBody
	public void setModify(@ModelAttribute CommentVO cvo) {
		cSrv.setCommentModify(cvo);
	}
}
