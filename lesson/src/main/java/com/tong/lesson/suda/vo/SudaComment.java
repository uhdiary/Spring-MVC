package com.tong.lesson.suda.vo;
import java.sql.Date;
public class SudaComment {
	private int comment_no;
	private int table_no;
	private String userid;
	private String story;
	private Date comment_date;
	public SudaComment(){}
	public SudaComment(int comment_no, int table_no, String userid, String story, Date comment_date) {
		super();
		this.comment_no = comment_no;
		this.table_no = table_no;
		this.userid = userid;
		this.story = story;
		this.comment_date = comment_date;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getTable_no() {
		return table_no;
	}
	public void setTable_no(int table_no) {
		this.table_no = table_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
}