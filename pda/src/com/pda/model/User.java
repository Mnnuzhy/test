package com.pda.model;

import java.util.Date;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private String idnumber;
	private Date birth;
	private String sex;
	private String tel;
	private String email;
	private String address;
	private String imag;
	private String idimag;
	private String registertime;
	private String updatetime;
    private int status;
	private String remark;
	// Constructors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdnumber() {
		return this.idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public Date getBirth() {
		return this.birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImag() {
		return this.imag;
	}

	public void setImag(String imag) {
		this.imag = imag;
	}

	public String getRegistertime() {
		return this.registertime;
	}

	public void setRegistertime(String registertime) {
		this.registertime = registertime;
	}

	public String getUpdatetime() {
		return this.updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getIdimag() {
		return idimag;
	}

	public void setIdimag(String idimag) {
		this.idimag = idimag;
	}
   
	
}