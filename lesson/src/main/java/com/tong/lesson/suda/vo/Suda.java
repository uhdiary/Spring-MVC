package com.tong.lesson.suda.vo;
import java.sql.Date;
public class Suda {
	private int table_no;
	private int table_sort;
	private String userid;
	private String title;
	private String story;
	private Date table_date;
	private int suda_readcount;
	public Suda(){}
	public Suda(int table_no, int table_sort, String userid, String title, String story, Date table_date,
			int suda_readcount) {
		super();
		this.table_no = table_no;
		this.table_sort = table_sort;
		this.userid = userid;
		this.title = title;
		this.story = story;
		this.table_date = table_date;
		this.suda_readcount = suda_readcount;
	}
	public int getTable_no() {
		return table_no;
	}
	public void setTable_no(int table_no) {
		this.table_no = table_no;
	}
	public int getTable_sort() {
		return table_sort;
	}
	public void setTable_sort(int table_sort) {
		this.table_sort = table_sort;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public Date getTable_date() {
		return table_date;
	}
	public void setTable_date(Date table_date) {
		this.table_date = table_date;
	}
	public int getSuda_readcount() {
		return suda_readcount;
	}
	public void setSuda_readcount(int suda_readcount) {
		this.suda_readcount = suda_readcount;
	}
	@Override
	public String toString() {
		return "Suda [table_no=" + table_no + ", table_sort=" + table_sort + ", userid=" + userid + ", title=" + title
				+ ", story=" + story + ", table_date=" + table_date + ", suda_readcount=" + suda_readcount + "]";
	}
}