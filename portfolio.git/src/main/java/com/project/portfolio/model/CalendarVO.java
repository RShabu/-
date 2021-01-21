package com.project.portfolio.model;

public class CalendarVO {
	private int cal_id;
	private String startDate;
	private String endDate;
	private String calContent;
	private String empNum;
	
	public int getCal_id() {
		return cal_id;
	}
	public void setCal_id(int cal_id) {
		this.cal_id = cal_id;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getCalContent() {
		return calContent;
	}
	public void setCalContent(String calContent) {
		this.calContent = calContent;
	}
	public String getEmpNum() {
		return empNum;
	}
	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}
}
