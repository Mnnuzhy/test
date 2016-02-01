package com.pda.model;

import java.util.Date;

/**
 * Exam entity. @author MyEclipse Persistence Tools
 */

public class Exam implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String examname;
	private String subject;
	private String begindate;

	

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getExamname() {
		return this.examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBegindate() {
		return this.begindate;
	}

	public void setBegindate(String begindate) {
		this.begindate = begindate;
	}

}