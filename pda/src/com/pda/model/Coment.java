package com.pda.model;

import java.io.Serializable;

public class Coment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int sid;
	private String coment;
	private String replycoment;
	private int tid;
	private int flag;
	private String comentdate;
	private String replydate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
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
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
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
