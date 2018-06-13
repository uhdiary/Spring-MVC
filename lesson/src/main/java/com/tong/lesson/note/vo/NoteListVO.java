package com.tong.lesson.note.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class NoteListVO implements Serializable{
	private String loginid;
	private String select;
	private String search;
	private String username;
	
	public NoteListVO() {
		super();
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	
}
