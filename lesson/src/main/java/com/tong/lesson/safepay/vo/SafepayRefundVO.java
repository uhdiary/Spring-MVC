package com.tong.lesson.safepay.vo;

import java.io.Serializable;
import java.sql.Date;

@SuppressWarnings("serial")
public class SafepayRefundVO implements Serializable {
	private int refundno;
	private int spaskno;
	private Date refundenrolldate;
	private String spprocesskind;
	private int studyprice;
	private int totalstudycount;
	private int completestudycount;
	private int refundprice;
	private String refundreason;
	private String teacherconfirmyn;
	private String resultyn;
	private String spaskuserid;
	
	public SafepayRefundVO(){}

	public SafepayRefundVO(int refundno, int spaskno, Date refundenrolldate, String spprocesskind, int studyprice,
			int totalstudycount, int completestudycount, int refundprice, String refundreason, String teacherconfirmyn,
			String resultyn, String spaskuserid) {
		super();
		this.refundno = refundno;
		this.spaskno = spaskno;
		this.refundenrolldate = refundenrolldate;
		this.spprocesskind = spprocesskind;
		this.studyprice = studyprice;
		this.totalstudycount = totalstudycount;
		this.completestudycount = completestudycount;
		this.refundprice = refundprice;
		this.refundreason = refundreason;
		this.teacherconfirmyn = teacherconfirmyn;
		this.resultyn = resultyn;
		this.spaskuserid = spaskuserid;
	}

	public int getREFUNDNO() {
		return refundno;
	}

	public void setRefundno(int refundno) {
		this.refundno = refundno;
	}

	public int getSPASKNO() {
		return spaskno;
	}

	public void setSpaskno(int spaskno) {
		this.spaskno = spaskno;
	}

	public Date getREFUNDENROLLDATE() {
		return refundenrolldate;
	}

	public void setRefundenrolldate(Date refundenrolldate) {
		this.refundenrolldate = refundenrolldate;
	}

	public String getSPPROCESSKIND() {
		return spprocesskind;
	}

	public void setSpprocesskind(String spprocesskind) {
		this.spprocesskind = spprocesskind;
	}

	public int getSTUDYPRICE() {
		return studyprice;
	}

	public void setStudyprice(int studyprice) {
		this.studyprice = studyprice;
	}

	public int getTOTALSTUDYCOUNT() {
		return totalstudycount;
	}

	public void setTotalstudycount(int totalstudycount) {
		this.totalstudycount = totalstudycount;
	}

	public int getCOMPLETESTUDYCOUNT() {
		return completestudycount;
	}

	public void setCompletestudycount(int completestudycount) {
		this.completestudycount = completestudycount;
	}

	public int getREFUNDPRICE() {
		return refundprice;
	}

	public void setRefundprice(int refundprice) {
		this.refundprice = refundprice;
	}

	public String getREFUNDREASON() {
		return refundreason;
	}

	public void setRefundreason(String refundreason) {
		this.refundreason = refundreason;
	}

	public String getTEACHERCONFIRMYN() {
		return teacherconfirmyn;
	}

	public void setTeacherconfirmyn(String teacherconfirmyn) {
		this.teacherconfirmyn = teacherconfirmyn;
	}

	public String getRESULTYN() {
		return resultyn;
	}

	public void setResultyn(String resultyn) {
		this.resultyn = resultyn;
	}
	
	public String getSPASKUSERID() {
		return spaskuserid;
	}

	public void setSpaskuserid(String Spaskuserid) {
		this.spaskuserid = Spaskuserid;
	}

	@Override
	public String toString() {
		return "refundno=" + refundno + ", spaskno=" + spaskno + ", refundenrolldate="
				+ refundenrolldate + ", spprocesskind=" + spprocesskind + ", studyprice=" + studyprice
				+ ", totalstudycount=" + totalstudycount + ", completestudycount=" + completestudycount
				+ ", refundprice=" + refundprice + ", refundreason=" + refundreason + ", teacherconfirmyn="
				+ teacherconfirmyn + ", resultyn=" + resultyn + ", spaskuserid=" + spaskuserid ;
	}
	
	
}
