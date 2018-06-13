package com.tong.lesson.member.vo;

import java.sql.Date;
import java.util.List;

public class MemberVO {
	   private String userid ;   /*아이디*/
	   private String userpwd ;      /*비밀번호*/
	   private String username;     /*이름*/
	   private String userno;         /*출생년도*/
	   private String phone;         /*휴대전화*/
	   private String postal;         /*우편번호*/
	   private String address;      /*주소*/
	   private String address_o;     /*상세주소*/
	   private String email ;         /*이메일*/
	   private String gender;         /*성별*/
	   private String userco ;        /*관리번호*/	    
	   private String accountname;      /*은행명*/
	   private String accountno ;      /*계좌번호*/
	   private Date enroll_date;
	   
	   public MemberVO(){}

	   public MemberVO(String userid, String userpwd, String username, String userno, String phone, String postal,
	      String address, String address_o, String email, String gender, String userco, String accountname,
	      String accountno, Date enroll_date) {
	   super();
	   this.userid = userid;
	   this.userpwd = userpwd;
	   this.username = username;
	   this.userno = userno;
	   this.phone = phone;
	   this.postal = postal;
	   this.address = address;
	   this.address_o = address_o;
	   this.email = email;
	   this.gender = gender;
	   this.userco = userco;
	   this.accountname = accountname;
	   this.accountno = accountno;
	   this.enroll_date = enroll_date;
	   }

	public String getUserid() {
	   return userid;
	}

	public void setUserid(String userid) {
	   this.userid = userid;
	}

	public String getUserpwd() {
	   return userpwd;
	}

	public void setUserpwd(String userpwd) {
	   this.userpwd = userpwd;
	}

	public String getUsername() {
	   return username;
	}

	public void setUsername(String username) {
	   this.username = username;
	}

	public String getUserno() {
	   return userno;
	}

	public void setUserno(String userno) {
	   this.userno = userno;
	}

	public String getPhone() {
	   return phone;
	}

	public void setPhone(String phone) {
	   this.phone = phone;
	}

	public String getPostal() {
	   return postal;
	}

	public void setPostal(String postal) {
	   this.postal = postal;
	}

	public String getAddress() {
	   return address;
	}

	public void setAddress(String address) {
	   this.address = address;
	}

	public String getAddress_o() {
	   return address_o;
	}

	public void setAddress_o(String address_o) {
	   this.address_o = address_o;
	}

	public String getEmail() {
	   return email;
	}

	public void setEmail(String email) {
	   this.email = email;
	}

	public String getGender() {
	   return gender;
	}

	public void setGender(String gender) {
	   this.gender = gender;
	}

	public String getUserco() {
	   return userco;
	}

	public void setUserco(String userco) {
	   this.userco = userco;
	}

	public String getAccountname() {
	   return accountname;
	}

	public void setAccountname(String accountname) {
	   this.accountname = accountname;
	}

	public String getAccountno() {
	   return accountno;
	}

	public void setAccountno(String accountno) {
	   this.accountno = accountno;
	}

	public Date getEnroll_date() {
	   return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
	   this.enroll_date = enroll_date;
	}

	@Override
	public String toString() {
	   return "MemberVO userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", userno=" + userno
	         + ", phone=" + phone + ", postal=" + postal + ", address=" + address + ", address_o=" + address_o
	         + ", email=" + email + ", gender=" + gender + ", userco=" + userco + ", accountname=" + accountname
	         + ", accountno=" + accountno + ", enroll_date=" + enroll_date;
	}



}