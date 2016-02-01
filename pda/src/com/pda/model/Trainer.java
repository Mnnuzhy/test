package com.pda.model;

/**
 * Trainer entity. @author MyEclipse Persistence Tools
 */

public class Trainer implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer tid;
	private Integer year;
	private Integer price;
	private String place;
	private String instruction;
	private String imag;
	private String imag1;
	private String imag2;

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTid() {
		return this.tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getInstruction() {
		return instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}

	public String getImag() {
		return imag;
	}

	public void setImag(String imag) {
		this.imag = imag;
	}

	public String getImag1() {
		return imag1;
	}

	public void setImag1(String imag1) {
		this.imag1 = imag1;
	}

	public String getImag2() {
		return imag2;
	}

	public void setImag2(String imag2) {
		this.imag2 = imag2;
	}

   
	
}