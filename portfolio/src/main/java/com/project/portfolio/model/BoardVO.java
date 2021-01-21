package com.project.portfolio.model;

import java.util.Date;

public class BoardVO {
	
	private int boardid;
	private String boardGroup;
	private String boardCode;
	private String boardColor;
	private String boardMaker;
	private String boardTitle;
	private String boardRead;
	private String boardWrite;
	private String boardReply;
	private String boardDownload;
	private String boardType;
	private Date boardRegdate;

	public int getBoardid() {
		return boardid;
	}
	public void setBoardid(int boardid) {
		this.boardid = boardid;
	}
	public String getBoardGroup() {
		return boardGroup;
	}
	public void setBoardGroup(String boardGroup) {
		this.boardGroup = boardGroup;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public String getBoardColor() {
		return boardColor;
	}
	public void setBoardColor(String boardColor) {
		this.boardColor = boardColor;
	}
	public String getBoardMaker() {
		return boardMaker;
	}
	public void setBoardMaker(String boardMaker) {
		this.boardMaker = boardMaker;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardRead() {
		return boardRead;
	}
	public void setBoardRead(String boardRead) {
		this.boardRead = boardRead;
	}
	public String getBoardWrite() {
		return boardWrite;
	}
	public void setBoardWrite(String boardWrite) {
		this.boardWrite = boardWrite;
	}
	public String getBoardReply() {
		return boardReply;
	}
	public void setBoardReply(String boardReply) {
		this.boardReply = boardReply;
	}
	public String getBoardDownload() {
		return boardDownload;
	}
	public void setBoardDownload(String boardDownload) {
		this.boardDownload = boardDownload;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public Date getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(Date boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	
	
}
