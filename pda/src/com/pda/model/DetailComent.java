package com.pda.model;

import java.io.Serializable;

public class DetailComent implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String  sname;
	private String coment;
	private String replycoment;
	private String tname;
	private String comentdate;
	private String replydate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public String getReplycoment() {
		return replycoment;
	}
	public void setReplycoment(String replycoment) {
		this.replycoment = replycoment;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getComentdate() {
		return comentdate;
	}
	public void setComentdate(String comentdate) {
		this.comentdate = comentdate;
	}
	public String getReplydate() {
		return replydate;
	}
	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}
	
	
	

}
