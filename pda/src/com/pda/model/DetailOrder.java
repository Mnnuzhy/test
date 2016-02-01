package com.pda.model;

import java.io.Serializable;

public class DetailOrder implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String  sname;
	private String idnumber;
	private String subject;
	private String date;
	private String permision;
	private String imag;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getIdnumber() {
		return idnumber;
	}
	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPermision() {
		return permision;
	}
	public void setPermision(String permision) {
		this.permision = permision;
	}
	public String getImag() {
		return imag;
	}
	public void setImag(String imag) {
		this.imag = imag;
	}
	
	
	
	
	

}
