package com.tong.lesson.teacher.vo;

import java.io.Serializable;
import java.sql.Date;

public class TeacherInfoVO extends TeacherVO implements Serializable{
	private int ep_no;
	private String userid;
	private String teacher_id;
	private int mark;
	private String review;
	private int tinf_no;
	private int ep_count;
	private Date t_ep_day;
	
	public TeacherInfoVO(){
		
	}

	
	public TeacherInfoVO(int ep_no, String userid, String teacher_id, int mark, String review, int ep_count,
			Date t_ep_day, int tinf_no) {
		super();
		this.ep_no = ep_no;
		this.userid = userid;
		this.teacher_id = teacher_id;
		this.mark = mark;
		this.review = review;
		this.ep_count = ep_count;
		this.t_ep_day = t_ep_day;
		this.tinf_no = tinf_no;
		
	}

	public int getTinf_no() {
		return tinf_no;
	}


	public void setTinf_no(int tinf_no) {
		this.tinf_no = tinf_no;
	}


	public Date getT_ep_day() {
		return t_ep_day;
	}


	public void setT_ep_day(Date t_ep_day) {
		this.t_ep_day = t_ep_day;
	}


	public int getEp_no() {
		return ep_no;
	}

	public void setEp_no(int ep_no) {
		this.ep_no = ep_no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public int getMark() {
		return mark;
	}

	public void setMark(int mark) {
		this.mark = mark;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getEp_count() {
		return ep_count;
	}

	public void setEp_count(int ep_count) {
		this.ep_count = ep_count;
	}


	@Override
	public String toString() {
		return "TeacherInfoVO [ep_no=" + ep_no + ", userid=" + userid + ", teacher_id=" + teacher_id + ", mark=" + mark
				+ ", review=" + review + ", tinf_no=" + tinf_no + ", ep_count=" + ep_count + ", t_ep_day=" + t_ep_day
				+ ", getTinf_no()=" + getTinf_no() + ", getT_ep_day()=" + getT_ep_day() + ", getEp_no()=" + getEp_no()
				+ ", getUserid()=" + getUserid() + ", getTeacher_id()=" + getTeacher_id() + ", getMark()=" + getMark()
				+ ", getReview()=" + getReview() + ", getEp_count()=" + getEp_count() + ", getGender()=" + getGender()
				+ ", getTinf_title()=" + getTinf_title() + ", getSubject()=" + getSubject() + ", getSelf()=" + getSelf()
				+ ", getOriginalfilepath()=" + getOriginalfilepath() + ", getRenamefilepath()=" + getRenamefilepath()
				+ ", getSubject_price()=" + getSubject_price() + ", getTime_price()=" + getTime_price()
				+ ", getWish_price()=" + getWish_price() + ", getAcademic()=" + getAcademic() + ", getUniversity()="
				+ getUniversity() + ", getMajor()=" + getMajor() + ", getUniversity_state()=" + getUniversity_state()
				+ ", getPossibility_time()=" + getPossibility_time() + ", getCareer()=" + getCareer()
				+ ", getLesson_style()=" + getLesson_style() + ", getLesson_area()=" + getLesson_area()
				+ ", getCall_time()=" + getCall_time() + ", getLesson_target()=" + getLesson_target()
				+ ", getPlace_check()=" + getPlace_check() + ", getPlace()=" + getPlace() + ", getPrice_check()="
				+ getPrice_check() + ", getImg_check()=" + getImg_check() + ", getFree_check()=" + getFree_check()
				+ ", getTc_count()=" + getTc_count() + ", toString()=" + super.toString() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}


}
