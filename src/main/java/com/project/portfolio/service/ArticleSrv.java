package com.project.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.model.ArticleVO;
import com.project.portfolio.model.BoardVO;
import com.project.portfolio.repository.ArticleDao;

@Service
public class ArticleSrv {
	
	@Autowired
	ArticleDao articleDao;
	
	public List<ArticleVO> getArticleList(
			int start, 
			int end,
			String words, 
			String searchOpt,
			String boardCode) {
		
		return articleDao.getArticleList(start, end, words, searchOpt, boardCode);
	}
	
	public int getArticleCount(String words, String searchOpt, String boardCode) {
		return articleDao.getArticleCount(words, searchOpt, boardCode);
	}

	
	public int setArticle(ArticleVO vo) {
		String subject 	= vo.getSubject();
		String writer 	= vo.getWriter();
		String content 	= vo.getContent();
		
		subject 	= subject.replace("<", "&lt;");
		subject 	= subject.replace("<", "&gt;");
		writer 		= writer.replace("<", "&lt;");
		writer 		= writer.replace("<", "&gt;");
		content 	= content.replace("<", "&lt;");
		content 	= content.replace("<", "&gt;");
		
		subject		= subject.replace(" ", "&nbsp;");
		writer		= writer.replace(" ", "&nbsp;");
		
		content 	= content.replace("\n", "<br />");
		
		vo.setSubject(subject);
		vo.setWriter(writer);
		vo.setContent(content);
		
		return articleDao.setArticle(vo);
	}

	
	public ArticleVO getArticleOne(ArticleVO avo) {
		return articleDao.getArticleOne(avo);
	}

	public BoardVO getBoardOne(String boardCode) {
		return articleDao.getBoardOne(boardCode);
	}
	
	public void hitUp(ArticleVO avo) {
		articleDao.hitUp(avo);
	}

	
	public int setArticleDelete(int articleid, String boardCode) {
		return articleDao.setArticleDelete(articleid, boardCode);
	}

	
	public int setArticleModify(ArticleVO vo) {
		return articleDao.setArticleModify(vo);
	}

	
	public int setArticleDeleteAll(int aid, String boardCode) {
		return articleDao.setArticleDeleteAll(aid, boardCode);
	}

	
	public ArticleVO getArticleReplyInfo(ArticleVO avo) throws Exception {
		return null;
	}

	
	public int setArticleRef(ArticleVO avo) throws Exception {
		return 0;
	}

	
	public int setArticleReply(ArticleVO avo) throws Exception {
		
		ArticleVO dto = articleDao.getArticleReplyInfo(avo);
		avo.setRef(dto.getRef()); //update
		avo.setRe_step(dto.getRe_step());
		avo.setRe_level(dto.getRe_level());
		
		int result = 0;
		
		result += articleDao.setArticleRef(avo);
		result += articleDao.setArticleReply(avo);
		
		return result;
	}
	
	public List<ArticleVO> getAdminArticle(
			String words, 
			String searchOpt,
			String boardCode) {
		
		return articleDao.getAdminArticle(words, searchOpt, boardCode);
	}
}
