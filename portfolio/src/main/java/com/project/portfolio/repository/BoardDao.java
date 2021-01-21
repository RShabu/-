package com.project.portfolio.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.portfolio.model.BoardVO;
import com.project.portfolio.model.EmployeeVO;

@Repository
public class BoardDao {
	
	@Autowired
	SqlSession sqlSession;
	
	
	public void setBoard(BoardVO bvo) {
		sqlSession.insert("board.setBoard", bvo);
	}

	public List<BoardVO> getBoardList(int start, int end, String words, String searchOpt) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		map.put("start", start);
		map.put("end", end);

		return sqlSession.selectList("board.getBoardList", map);
	}
	
	public BoardVO getBoardOne() {
		return sqlSession.selectOne("board.getBoardOne");
	}
	
	public BoardVO getBoardOne(EmployeeVO evo) {
		return sqlSession.selectOne("board.getBoardOne", evo);
	}
	
	public void setBoardDelete(String boardCode) {
		sqlSession.delete("board.setBoardDelete", boardCode);
	}
	
	public int getBoardCount(String searchOpt, String words) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		
		return sqlSession.selectOne("board.getBoardCount", map);
	}
	
	public void createArticleTbl(String boardCode) {
		String str = "CREATE TABLE grp_article_" + boardCode;
		str += "(articleid int not null auto_increment primary key,";
		str += "division char(1),";
		str += "subject varchar(300) not null,";
		str += "writer varchar(20) not null,";
		str += "content text,";
		str += "regdate datetime,";
		str += "hit int default 0,";
		str += "fileName varchar(300),";
		str += "fileOriName varchar(300),";
		str += "fileURL varchar(500),";
		str += "ref int,";
		str += "re_step int,";
		str += "re_level int);";
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sqlSession.update("board.createArticleTbl", map);

	}
	
	public void createCommentTbl(String boardCode) {
		String str = "CREATE TABLE grp_comment_" + boardCode;
		str += "(commentid int not null auto_increment primary key,";
		str += "articleid int not null,";
		str += "comment text,";
		str += "who varchar(20),";
		str += "regdate datetime);";
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sqlSession.update("board.createCommentTbl", map);
	}
}
