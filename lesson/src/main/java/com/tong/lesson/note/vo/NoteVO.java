package com.tong.lesson.note.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class NoteVO implements java.io.Serializable {
	private int note_idx;
	private String notect;
	private Date senddt;
	private String sendid;
	private String receiveid;
	private String senddel;
	private String reveicedel;
	private String viewyn;
	private String note_original_filename;
	private String note_rename_filename;
	private String username;

	public NoteVO() {
		super();
	}
	

	public NoteVO(int note_idx, String notect, Date senddt, String sendid, String receiveid, String senddel,
			String reveicedel, String viewyn, String note_original_filename, String note_rename_filename,
			String username) {
		super();
		this.note_idx = note_idx;
		this.notect = notect;
		this.senddt = senddt;
		this.sendid = sendid;
		this.receiveid = receiveid;
		this.senddel = senddel;
		this.reveicedel = reveicedel;
		this.viewyn = viewyn;
		this.note_original_filename = note_original_filename;
		this.note_rename_filename = note_rename_filename;
		this.username = username;
	}


	public int getNote_idx() {
		return note_idx;
	}

	public void setNote_idx(int note_idx) {
		this.note_idx = note_idx;
	}

	public String getNotect() {
		return notect;
	}

	public void setNotect(String notect) {
		this.notect = notect;
	}

	public Date getSenddt() {
		return senddt;
	}

	public void setSenddt(Date senddt) {
		this.senddt = senddt;
	}

	public String getSendid() {
		return sendid;
	}

	public void setSendid(String sendid) {
		this.sendid = sendid;
	}

	public String getReceiveid() {
		return receiveid;
	}

	public void setReceiveid(String receiveid) {
		this.receiveid = receiveid;
	}

	public String getSenddel() {
		return senddel;
	}

	public void setSenddel(String senddel) {
		this.senddel = senddel;
	}

	public String getReveicedel() {
		return reveicedel;
	}

	public void setReveicedel(String reveicedel) {
		this.reveicedel = reveicedel;
	}

	public String getViewyn() {
		return viewyn;
	}

	public void setViewyn(String viewyn) {
		this.viewyn = viewyn;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNote_original_filename() {
		return note_original_filename;
	}

	public void setNote_original_filename(String note_original_filename) {
		this.note_original_filename = note_original_filename;
	}

	public String getNote_rename_filename() {
		return note_rename_filename;
	}

	public void setNote_rename_filename(String note_rename_filename) {
		this.note_rename_filename = note_rename_filename;
	}

	@Override
	public String toString() {
		return "NoteVO [note_idx=" + note_idx + ", notect=" + notect + ", senddt=" + senddt + ", sendid=" + sendid
				+ ", receiveid=" + receiveid + ", senddel=" + senddel + ", reveicedel=" + reveicedel + ", viewyn="
				+ viewyn + ", note_original_filename=" + note_original_filename + ", note_rename_filename="
				+ note_rename_filename + ", username=" + username + "]";
	}

}
	
/*select * from tb_note where 'user01'=RECEIVEID;
commit;
select  NOTE_IDX
,NOTECT
,SENDDT
,SENDID
,RECEIVEID
,SENDDEL
,RECEIVEDEL
,VIEWYN
,username
from tb_note 
join member on(SENDID = userid)
where 'user01' = RECEIVEID;*/