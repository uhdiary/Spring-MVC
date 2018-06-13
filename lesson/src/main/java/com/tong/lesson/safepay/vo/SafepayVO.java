package com.tong.lesson.safepay.vo;

import java.io.Serializable;
import java.sql.Date;

@SuppressWarnings("serial")
public class SafepayVO implements Serializable {
	private int spaskno;
	private String spprocesskind;
	private Date spenrolldate;
	private String spaskuserid;
	private String spteacherid;
	private Date startstudydate;
	private Date endstudydate;
	private int studyprice;
	private int studycount;
	private String havingynrefund;
	
	public SafepayVO(){}

	public SafepayVO(int spaskno, String spprocesskind, Date spenrolldate, String spaskuserid, String spteacherid,
			Date startstudydate, Date endstudydate, int studyprice, int studycount, String havingynrefund) {
		super();
		this.spaskno = spaskno;
		this.spprocesskind = spprocesskind;
		this.spenrolldate = spenrolldate;
		this.spaskuserid = spaskuserid;
		this.spteacherid = spteacherid;
		this.startstudydate = startstudydate;
		this.endstudydate = endstudydate;
		this.studyprice = studyprice;
		this.studycount = studycount;
		this.havingynrefund = havingynrefund;
	}

	public int getSpaskno() {
		return spaskno;
	}

	public void setSpaskno(int spaskno) {
		this.spaskno = spaskno;
	}

	public String getSpprocesskind() {
		return spprocesskind;
	}

	public void setSpprocesskind(String spprocesskind) {
		this.spprocesskind = spprocesskind;
	}

	public Date getSpenrolldate() {
		return spenrolldate;
	}

	public void setSpenrolldate(Date spenrolldate) {
		this.spenrolldate = spenrolldate;
	}

	public String getSPASKUSERID() {
		return spaskuserid;
	}

	public void setSpaskuserid(String spaskuserid) {
		this.spaskuserid = spaskuserid;
	}

	public String getSPTEACHERID() {
		return spteacherid;
	}

	public void setSpteacherid(String spteacherid) {
		this.spteacherid = spteacherid;
	}

	public Date getSTARTSTUDYDATE() {
		return startstudydate;
	}

	public void setStartstudydate(Date startstudydate) {
		this.startstudydate = startstudydate;
	}

	public Date getENDSTUDYDATE() {
		return endstudydate;
	}

	public void setEndstudydate(Date endstudydate) {
		this.endstudydate = endstudydate;
	}

	public int getSTUDYPRICE() {
		return studyprice;
	}

	public void setStudyprice(int studyprice) {
		this.studyprice = studyprice;
	}

	public int getSTUDYCOUNT() {
		return studycount;
	}

	public void setStudycount(int studycount) {
		this.studycount = studycount;
	}
	
	public String getHAVINGYNREFUND(){
		return havingynrefund;
	}
	
	public void setHavingynrefund(String havingynrefund){
		this.havingynrefund = havingynrefund;
	}

	@Override
	public String toString() {
		return "SafepayVO [spaskno=" + spaskno + ", spprocesskind=" + spprocesskind + ", spenrolldate=" + spenrolldate
				+ ", spaskuserid=" + spaskuserid + ", spteacherid=" + spteacherid + ", startstudydate=" + startstudydate
				+ ", endstudydate=" + endstudydate + ", studyprice=" + studyprice + ", studycount=" + studycount
				+ ", havingynrefund=" + havingynrefund+ "]";
	}
	
	
}
