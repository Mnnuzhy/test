package com.pda.model;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer sid;
	private String coment;
	private String replaycoment;
	private Integer replaytid;

	
	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getComent() {
		return this.coment;
	}

	public void setComent(String coment) {
		this.coment = coment;
	}

	public String getReplaycoment() {
		return this.replaycoment;
	}

	public void setReplaycoment(String replaycoment) {
		this.replaycoment = replaycoment;
	}

	public Integer getReplaytid() {
		return this.replaytid;
	}

	public void setReplaytid(Integer replaytid) {
		this.replaytid = replaytid;
	}

}