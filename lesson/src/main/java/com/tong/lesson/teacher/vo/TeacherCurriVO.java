package com.tong.lesson.teacher.vo;

import java.io.Serializable;

public class TeacherCurriVO extends TeacherInfoVO implements Serializable{

	private int cur_num;
	private String userid;
	private int tinf_no;
	private String c_originalfilepath;
	private String c_renamefilepath;
	
	
	public TeacherCurriVO(){
		
	}


	public TeacherCurriVO(int cur_num, String userid, int tinf_no, String c_originalfilepath, String c_renamefilepath) {
		super();
		this.cur_num = cur_num;
		this.userid = userid;
		this.tinf_no = tinf_no;
		this.c_originalfilepath = c_originalfilepath;
		this.c_renamefilepath = c_renamefilepath;
	}


	public int getCur_num() {
		return cur_num;
	}


	public void setCur_num(int cur_num) {
		this.cur_num = cur_num;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public int getTinf_no() {
		return tinf_no;
	}


	public void setTinf_no(int tinf_no) {
		this.tinf_no = tinf_no;
	}


	public String getC_originalfilepath() {
		return c_originalfilepath;
	}


	public void setC_originalfilepath(String c_originalfilepath) {
		this.c_originalfilepath = c_originalfilepath;
	}


	public String getC_renamefilepath() {
		return c_renamefilepath;
	}


	public void setC_renamefilepath(String c_renamefilepath) {
		this.c_renamefilepath = c_renamefilepath;
	}


	@Override
	public String toString() {
		return "TeacherCurriVO [cur_num=" + cur_num + ", userid=" + userid + ", tinf_no=" + tinf_no
				+ ", c_originalfilepath=" + c_originalfilepath + ", c_renamefilepath=" + c_renamefilepath + "]";
	}


	
}
