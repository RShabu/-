package com.project.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.model.CommentVO;
import com.project.portfolio.repository.CommentDao;

@Service
public class CommentSrv {

	@Autowired
	CommentDao cDao;
	
	public void setComment(CommentVO cvo) {
		cDao.setComment(cvo);
	}
	
	public List<CommentVO> getCommentList(CommentVO cvo) {
		return cDao.getCommentList(cvo);
	}
	
	public int getCommentCount(CommentVO cvo) {
		return cDao.getCommentCount(cvo);
	}
	
	public void setCommentDelete(CommentVO cvo) {
		cDao.setCommentDelete(cvo);
	}
	
	public void setCommentModify(CommentVO cvo) {
		cDao.setCommentModify(cvo);
	}
}
