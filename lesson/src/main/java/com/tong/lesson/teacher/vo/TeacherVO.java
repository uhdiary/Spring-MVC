package com.tong.lesson.teacher.vo;

import java.io.Serializable;

public class TeacherVO implements Serializable{
	
	private int tinf_no;
	private String userid;
	private String subject;
	private String tinf_title;
	private String self;
	private String originalfilepath;
	private String renamefilepath;
	private int subject_price;
	private int time_price;
	private int wish_price;
	private String academic;
	private String university;
	private String major;
	private String university_state;
	private String possibility_time;
	private int career;
	private String lesson_style;
	private String lesson_area;
	private String call_time;
	private String lesson_target;
	private String place_check;
	private String place;
	private String price_check;
	private String img_check;
	private String free_check;
	private int tc_count;
	private String gender; 
	private int cur_num;
	private String c_originalfilepath;
	private String c_renamefilepath;
	
	public TeacherVO(){
		
	}

	public TeacherVO(int tinf_no, String userid, String subject, String tinf_title, String self,
			String originalfilepath, String renamefilepath, int subject_price, int time_price, int wish_price,
			String academic, String university, String major, String university_state, String possibility_time,
			int career, String lesson_style, String lesson_area, String call_time, String lesson_target,
			String place_check, String place, String price_check, String img_check, String free_check, int tc_count,
			String gender, int cur_num, String c_originalfilepath, String c_renamefilepath) {
		super();
		this.tinf_no = tinf_no;
		this.userid = userid;
		this.subject = subject;
		this.tinf_title = tinf_title;
		this.self = self;
		this.originalfilepath = originalfilepath;
		this.renamefilepath = renamefilepath;
		this.subject_price = subject_price;
		this.time_price = time_price;
		this.wish_price = wish_price;
		this.academic = academic;
		this.university = university;
		this.major = major;
		this.university_state = university_state;
		this.possibility_time = possibility_time;
		this.career = career;
		this.lesson_style = lesson_style;
		this.lesson_area = lesson_area;
		this.call_time = call_time;
		this.lesson_target = lesson_target;
		this.place_check = place_check;
		this.place = place;
		this.price_check = price_check;
		this.img_check = img_check;
		this.free_check = free_check;
		this.tc_count = tc_count;
		this.gender = gender;
		this.cur_num = cur_num;
		this.c_originalfilepath = c_originalfilepath;
		this.c_renamefilepath = c_renamefilepath;
	}

	public int getTinf_no() {
		return tinf_no;
	}

	public void setTinf_no(int tinf_no) {
		this.tinf_no = tinf_no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTinf_title() {
		return tinf_title;
	}

	public void setTinf_title(String tinf_title) {
		this.tinf_title = tinf_title;
	}

	public String getSelf() {
		return self;
	}

	public void setSelf(String self) {
		this.self = self;
	}

	public String getOriginalfilepath() {
		return originalfilepath;
	}

	public void setOriginalfilepath(String originalfilepath) {
		this.originalfilepath = originalfilepath;
	}

	public String getRenamefilepath() {
		return renamefilepath;
	}

	public void setRenamefilepath(String renamefilepath) {
		this.renamefilepath = renamefilepath;
	}

	public int getSubject_price() {
		return subject_price;
	}

	public void setSubject_price(int subject_price) {
		this.subject_price = subject_price;
	}

	public int getTime_price() {
		return time_price;
	}

	public void setTime_price(int time_price) {
		this.time_price = time_price;
	}

	public int getWish_price() {
		return wish_price;
	}

	public void setWish_price(int wish_price) {
		this.wish_price = wish_price;
	}

	public String getAcademic() {
		return academic;
	}

	public void setAcademic(String academic) {
		this.academic = academic;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getUniversity_state() {
		return university_state;
	}

	public void setUniversity_state(String university_state) {
		this.university_state = university_state;
	}

	public String getPossibility_time() {
		return possibility_time;
	}

	public void setPossibility_time(String possibility_time) {
		this.possibility_time = possibility_time;
	}

	public int getCareer() {
		return career;
	}

	public void setCareer(int career) {
		this.career = career;
	}

	public String getLesson_style() {
		return lesson_style;
	}

	public void setLesson_style(String lesson_style) {
		this.lesson_style = lesson_style;
	}

	public String getLesson_area() {
		return lesson_area;
	}

	public void setLesson_area(String lesson_area) {
		this.lesson_area = lesson_area;
	}

	public String getCall_time() {
		return call_time;
	}

	public void setCall_time(String call_time) {
		this.call_time = call_time;
	}

	public String getLesson_target() {
		return lesson_target;
	}

	public void setLesson_target(String lesson_target) {
		this.lesson_target = lesson_target;
	}

	public String getPlace_check() {
		return place_check;
	}

	public void setPlace_check(String place_check) {
		this.place_check = place_check;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getPrice_check() {
		return price_check;
	}

	public void setPrice_check(String price_check) {
		this.price_check = price_check;
	}

	public String getImg_check() {
		return img_check;
	}

	public void setImg_check(String img_check) {
		this.img_check = img_check;
	}

	public String getFree_check() {
		return free_check;
	}

	public void setFree_check(String free_check) {
		this.free_check = free_check;
	}

	public int getTc_count() {
		return tc_count;
	}

	public void setTc_count(int tc_count) {
		this.tc_count = tc_count;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getCur_num() {
		return cur_num;
	}

	public void setCur_num(int cur_num) {
		this.cur_num = cur_num;
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
		return "TeacherVO [tinf_no=" + tinf_no + ", userid=" + userid + ", subject=" + subject + ", tinf_title="
				+ tinf_title + ", self=" + self + ", originalfilepath=" + originalfilepath + ", renamefilepath="
				+ renamefilepath + ", subject_price=" + subject_price + ", time_price=" + time_price + ", wish_price="
				+ wish_price + ", academic=" + academic + ", university=" + university + ", major=" + major
				+ ", university_state=" + university_state + ", possibility_time=" + possibility_time + ", career="
				+ career + ", lesson_style=" + lesson_style + ", lesson_area=" + lesson_area + ", call_time="
				+ call_time + ", lesson_target=" + lesson_target + ", place_check=" + place_check + ", place=" + place
				+ ", price_check=" + price_check + ", img_check=" + img_check + ", free_check=" + free_check
				+ ", tc_count=" + tc_count + ", gender=" + gender + ", cur_num=" + cur_num + ", c_originalfilepath="
				+ c_originalfilepath + ", c_renamefilepath=" + c_renamefilepath + "]";
	}
	
	

	
}
