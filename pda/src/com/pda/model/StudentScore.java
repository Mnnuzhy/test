package com.pda.model;

/**
 * Examscore entity. @author MyEclipse Persistence Tools
 */

public class StudentScore implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private String examname;
	private String examsubject;
	private int score;
	public String getExamname() {
		return examname;
	}
	public void setExamname(String examname) {
		this.examname = examname;
	}
	public String getExamsubject() {
		return examsubject;
	}
	public void setExamsubject(String examsubject) {
		this.examsubject = examsubject;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

	
	// Property accessors


	

}