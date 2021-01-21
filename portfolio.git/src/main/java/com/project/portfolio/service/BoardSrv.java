package com.project.portfolio.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.model.BoardVO;
import com.project.portfolio.model.EmployeeVO;
import com.project.portfolio.repository.BoardDao;

@Service
public class BoardSrv {

	@Autowired
	BoardDao bDao;
	
	public void setBoard(BoardVO bvo) {
		bDao.setBoard(bvo);
	}

	public List<BoardVO> getBoardList(int start, int end, String words, String searchOpt) {
		return bDao.getBoardList(start, end, words, searchOpt);
	}

	public BoardVO getBoardOne() {
		return bDao.getBoardOne();
	}
	
	public BoardVO getBoardOne(EmployeeVO evo) {
		return bDao.getBoardOne(evo);
	}
	
	public void setBoardDelete(String boardCode) {
		bDao.setBoardDelete(boardCode);
	}
	
	public int getBoardCount(String searchOpt, String words) {
		return bDao.getBoardCount(searchOpt, words);
	}

	public void createArticleTbl(String boardCode) {
		bDao.createArticleTbl(boardCode);
	}

	public void createCommentTbl(String boardCode) {
		bDao.createCommentTbl(boardCode);
	}
}
