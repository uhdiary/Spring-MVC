package com.tong.lesson.chat.controller;

	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.RequestMapping;


	@Controller
	public class BroadCast {
		
		@RequestMapping("chat")
		public String viewChatingPage(){
			return "chat/chat";

		}
	}

