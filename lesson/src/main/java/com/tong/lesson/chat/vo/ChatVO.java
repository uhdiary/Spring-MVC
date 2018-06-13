package com.tong.lesson.chat.vo;

public class ChatVO {
		private String type;
		private String text;
		private String id;
		private String date;
		
		public ChatVO() {
			super();
		}
		public ChatVO(String type, String text, String id, String date) {
			super();
			this.type = type;
			this.text = text;
			this.id = id;
			this.date = date;
		}
	
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getText() {
			return text;
		}
		public void setText(String text) {
			this.text = text;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		
	}

