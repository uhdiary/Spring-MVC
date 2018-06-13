package com.tong.lesson.student.vo;

public class StudentVO {
	private int SB_NO;
	private String SB_USERID;
	private String SB_AREA;
	private String SB_ORIGINFILE;
	private String SB_RENAMEFILE;
	private String SB_CLASSTIME;
	private int SB_NUM_TIMES;
	private String SB_WEEK_DAY;
	private String SB_PERIOD;
	private String SB_STYLE;
	private String SB_SUBJECT;
	private int SB_PRICE;
	private String SB_PERPOSE;
	private String SB_STATEMENT;
	private String SB_LEVEL;
	private String SB_INTRODUCE;
	private String SB_SORT;
	private String SB_LOCATION;
	
	public StudentVO(){}
	
	
	public StudentVO(int sB_NO, String sB_USERID, String sB_AREA, String sB_ORIGINFILE, String sB_RENAMEFILE,
			String sB_CLASSTIME, int sB_NUM_TIMES, String sB_WEEK_DAY, String sB_PERIOD, String sB_STYLE,
			String sB_SUBJECT, int sB_PRICE, String sB_PERPOSE, String sB_STATEMENT, String sB_LEVEL, String sB_INTRODUCE,String sB_SORT,
			String sB_LOCATION) {
		super();
		SB_NO = sB_NO;
		SB_USERID = sB_USERID;
		SB_AREA = sB_AREA;
		SB_ORIGINFILE = sB_ORIGINFILE;
		SB_RENAMEFILE = sB_RENAMEFILE;
		SB_CLASSTIME = sB_CLASSTIME;
		SB_NUM_TIMES = sB_NUM_TIMES;
		SB_WEEK_DAY = sB_WEEK_DAY;
		SB_PERIOD = sB_PERIOD;
		SB_STYLE = sB_STYLE;
		SB_SUBJECT = sB_SUBJECT;
		SB_PRICE = sB_PRICE;
		SB_PERPOSE = sB_PERPOSE;
		SB_STATEMENT = sB_STATEMENT;
		SB_LEVEL = sB_LEVEL;
		SB_INTRODUCE = sB_INTRODUCE;
		SB_SORT = sB_SORT;
		SB_LOCATION =sB_LOCATION;
	}


	public int getSB_NO() {
		return SB_NO;
	}

	public void setSB_NO(int SB_NO) {
		this.SB_NO = SB_NO;
	}

	public String getSB_USERID() {
		return SB_USERID;
	}

	public void setSB_USERID(String SB_USERID) {
		this.SB_USERID = SB_USERID;
	}
	
	public String getSB_AREA() {
		return SB_AREA;
	}

	public void setSB_AREA(String sB_AREA) {
		SB_AREA = sB_AREA;
	}

	public String getSB_ORIGINFILE() {
		return SB_ORIGINFILE;
	}

	public void setSB_ORIGINFILE(String SB_ORIGINFILE) {
		this.SB_ORIGINFILE = SB_ORIGINFILE;
	}

	public String getSB_RENAMEFILE() {
		return SB_RENAMEFILE;
	}

	public void setSB_RENAMEFILE(String SB_RENAMEFILE) {
		this.SB_RENAMEFILE = SB_RENAMEFILE;
	}

	public String getSB_CLASSTIME() {
		return SB_CLASSTIME;
	}

	public void setSB_CLASSTIME(String SB_CLASSTIME) {
		this.SB_CLASSTIME = SB_CLASSTIME;
	}

	public int getSB_NUM_TIMES() {
		return SB_NUM_TIMES;
	}

	public void setSB_NUM_TIMES(int SB_NUM_TIMES) {
		this.SB_NUM_TIMES = SB_NUM_TIMES;
	}

	public String getSB_WEEK_DAY() {
		return SB_WEEK_DAY;
	}

	public void setSB_WEEK_DAY(String SB_WEEK_DAY) {
		this.SB_WEEK_DAY = SB_WEEK_DAY;
	}

	public String getSB_PERIOD() {
		return SB_PERIOD;
	}

	public void setSB_PERIOD(String SB_PERIOD) {
		this.SB_PERIOD = SB_PERIOD;
	}	

	public String getSB_STYLE() {
		return SB_STYLE;
	}

	public void setSB_STYLE(String SB_STYLE) {
		this.SB_STYLE = SB_STYLE;
	}


	public String getSB_SUBJECT() {
		return SB_SUBJECT;
	}

	public void setSB_SUBJECT(String SB_SUBJECT) {
		this.SB_SUBJECT = SB_SUBJECT;
	}

	public int getSB_PRICE() {
		return SB_PRICE;
	}

	public void setSB_PRICE(int SB_PRICE) {
		this.SB_PRICE = SB_PRICE;
	}
	
	public String getSB_PERPOSE() {
		return SB_PERPOSE;
	}

	public void setSB_PERPOSE(String SB_PERPOSE) {
		this.SB_PERPOSE = SB_PERPOSE;
	}

	public String getSB_STATEMENT() {
		return SB_STATEMENT;
	}

	public void setSB_STATEMENT(String SB_STATEMENT) {
		this.SB_STATEMENT = SB_STATEMENT;
	}

	public String getSB_LEVEL() {
		return SB_LEVEL;
	}

	public void setSB_LEVEL(String SB_LEVEL) {
		this.SB_LEVEL = SB_LEVEL;
	}	
	
	public String getSB_INTRODUCE() {
		return SB_INTRODUCE;
	}

	public void setSB_INTRODUCE(String sB_INTRODUCE) {
		SB_INTRODUCE = sB_INTRODUCE;
	}	

	public String getSB_SORT() {
		return SB_SORT;
	}

	public void setSB_SORT(String sB_SORT) {
		SB_SORT = sB_SORT;
	}

	public String getSB_LOCATION() {
		return SB_LOCATION;
	}

	public void setSB_LOCATION(String sB_LOCATION) {
		SB_LOCATION = sB_LOCATION;
	}


	public String toString(){
		return this.SB_NO +","+ this.SB_USERID+","+this.SB_AREA+","+this.SB_ORIGINFILE+","+this.SB_RENAMEFILE+","+ this.SB_CLASSTIME+","+
				this.SB_NUM_TIMES+","+this.SB_WEEK_DAY+","+this.SB_WEEK_DAY+","+this.SB_PERIOD+","+this.SB_STYLE+","+
				this.SB_SUBJECT+","+this.SB_PRICE+","+this.SB_PERPOSE+","+this.SB_STATEMENT+","+this.SB_LEVEL+","+this.SB_INTRODUCE
				+","+this.SB_SORT+","+this.SB_LOCATION;
	}
	
}