package com.tong.lesson.qboard.vo;

import java.sql.Date;

public class QboardVO {
   private int qboardno;
   private String qboardtitle;
   private String qboardwriter;
   private String qboardcontent;
   private Date qboarddate;
   private int readcount;
   private int qboardreplyref;
   private int qboardreplylev;
   private int qboardreplyseq;
   private String rnum;
   private String answeryn;

   
   public String getAnsweryn() {
	return answeryn;
   }

	public void setAnsweryn(String answeryn) {
		this.answeryn = answeryn;
	}

public String getRnum() {
      return rnum;
   }

   public void setRnum(String rnum) {
      this.rnum = rnum;
   }

   public QboardVO() {
      super();
   }
   

   public QboardVO(int qboardno, String qboardtitle, String qboardwriter, String qboardcontent, Date qboarddate,
		int readcount, int qboardreplyref, int qboardreplylev, int qboardreplyseq, String rnum, String answeryn) {
	super();
	this.qboardno = qboardno;
	this.qboardtitle = qboardtitle;
	this.qboardwriter = qboardwriter;
	this.qboardcontent = qboardcontent;
	this.qboarddate = qboarddate;
	this.readcount = readcount;
	this.qboardreplyref = qboardreplyref;
	this.qboardreplylev = qboardreplylev;
	this.qboardreplyseq = qboardreplyseq;
	this.rnum = rnum;
	this.answeryn = answeryn;
}

public int getQboardno() {
      return qboardno;
   }

   public void setQboardno(int qboardno) {
      this.qboardno = qboardno;
   }

   public String getQboardtitle() {
      return qboardtitle;
   }

   public void setQboardtitle(String qboardtitle) {
      this.qboardtitle = qboardtitle;
   }

   public String getQboardwriter() {
      return qboardwriter;
   }

   public void setQboardwriter(String qboardwriter) {
      this.qboardwriter = qboardwriter;
   }

   public String getQboardcontent() {
      return qboardcontent;
   }

   public void setQboardcontent(String qboardcontent) {
      this.qboardcontent = qboardcontent;
   }

   public Date getQboarddate() {
      return qboarddate;
   }

   public void setQboarddate(Date qboarddate) {
      this.qboarddate = qboarddate;
   }

   public int getReadcount() {
      return readcount;
   }

   public void setReadcount(int readcount) {
      this.readcount = readcount;
   }

   public int getQboardreplyref() {
      return qboardreplyref;
   }

   public void setQboardreplyref(int qboardreplyref) {
      this.qboardreplyref = qboardreplyref;
   }

   public int getQboardreplylev() {
      return qboardreplylev;
   }

   public void setQboardreplylev(int qboardreplylev) {
      this.qboardreplylev = qboardreplylev;
   }

   public int getQboardreplyseq() {
      return qboardreplyseq;
   }

   public void setQboardreplyseq(int qboardreplyseq) {
      this.qboardreplyseq = qboardreplyseq;
   }

   @Override
   public String toString() {
      return "QboardVO [qboardno=" + qboardno + ", qboardtitle=" + qboardtitle + ", qboardwriter=" + qboardwriter
            + ", qboardcontent=" + qboardcontent + ", qboarddate=" + qboarddate + ", readcount=" + readcount
            + ", qboardreplyref=" + qboardreplyref + ", qboardreplylev=" + qboardreplylev + ", qboardreplyseq="
            + qboardreplyseq + "]";
   }

}