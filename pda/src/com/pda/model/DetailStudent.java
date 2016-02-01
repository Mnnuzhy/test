package com.pda.model;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class DetailStudent implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private Integer sid;
	private String sname;
	private Integer tid;
	private Integer subjectone;
	private Integer subjecttow;
	private Integer subjectthree;
	private Integer subjectfour;
	private String imag;


	// Property accessors

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getSid() {
		return this.sid;
	}

	
	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getTid() {
		return this.tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public Integer getSubjectone() {
		return this.subjectone;
	}

	public void setSubjectone(Integer subjectone) {
		this.subjectone = subjectone;
	}

	public Integer getSubjecttow() {
		return this.subjecttow;
	}

	public void setSubjecttow(Integer subjecttow) {
		this.subjecttow = subjecttow;
	}

	public Integer getSubjectfour() {
		return this.subjectfour;
	}

	public void setSubjectfour(Integer subjectfour) {
		this.subjectfour = subjectfour;
	}

	public Integer getSubjectthree() {
		return subjectthree;
	}

	public void setSubjectthree(Integer subjectthree) {
		this.subjectthree = subjectthree;
	}

	public String getImag() {
		return imag;
	}

	public void setImag(String imag) {
		this.imag = imag;
	}

	
}