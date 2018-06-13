package com.tong.lesson.faqboard.vo;

public class FaqBoardVO {
	private int faqboardno;
	private String faqboardtitle;
	private String faqboardwriter;
	private String faqboardcontent;
	private int readcount;
	
	public FaqBoardVO(){}

	public FaqBoardVO(int faqboardno, String faqboardtitle, String faqboardwriter, String faqboardcontent,
			int readcount) {
		super();
		this.faqboardno = faqboardno;
		this.faqboardtitle = faqboardtitle;
		this.faqboardwriter = faqboardwriter;
		this.faqboardcontent = faqboardcontent;
		this.readcount = readcount;
	}

	public int getFaqboardno() {
		return faqboardno;
	}

	public void setFaqboardno(int faqboardno) {
		this.faqboardno = faqboardno;
	}

	public String getFaqboardtitle() {
		return faqboardtitle;
	}

	public void setFaqboardtitle(String faqboardtitle) {
		this.faqboardtitle = faqboardtitle;
	}

	public String getFaqboardwriter() {
		return faqboardwriter;
	}

	public void setFaqboardwriter(String faqboardwriter) {
		this.faqboardwriter = faqboardwriter;
	}

	public String getFaqboardcontent() {
		return faqboardcontent;
	}

	public void setFaqboardcontent(String faqboardcontent) {
		this.faqboardcontent = faqboardcontent;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	@Override
	public String toString() {
		return "FaqBoardVO [faqboardno=" + faqboardno + ", faqboardtitle=" + faqboardtitle + ", faqboardwriter="
				+ faqboardwriter + ", faqboardcontent=" + faqboardcontent + ", readcount=" + readcount + "]";
	};
	
}
