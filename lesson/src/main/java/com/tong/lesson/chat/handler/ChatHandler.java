package com.tong.lesson.chat.handler;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.*;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.tong.lesson.chat.vo.ChatVO;

@ServerEndpoint("/tong")
public class ChatHandler {

	private static List<Session> sessionusers = Collections.synchronizedList(new ArrayList<Session>());
	private Session usersession;

	public ChatHandler() {
	}

	@OnOpen
	public void handleOpen(Session usersession) throws IOException {
		/*
		 * System.out.println(usersession);
		 * System.out.println(usersession.getId());
		 */
		sessionusers.add(usersession);
		System.out.println("접속");
		System.out.println(sessionusers.size());
	}

	@OnMessage
	public void handleMessage(String message) throws IOException {
		Gson gson = new Gson();
		ChatVO chatvo = gson.fromJson(message, ChatVO.class);
		
		
		if(sessionusers.size() > 0){
			for (int i = 0; i < sessionusers.size(); i++)
				sessionusers.get(i).getBasicRemote()
					.sendText(JSONConverter(chatvo.getId(), chatvo.getText(),"message", "event"));
			}
		}
		
		/*ChatVO chatvo = this.msgTochatvo(message);*/
		/*this.groupDiv(chatvo, sessionusers.get(0));*/
/*
		List<Session> list = groupmap.get(chatvo.getGroupno());
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				// 자기자신의 메시지는 자기자신에게 보내지 않기
				if (list.get(i).getId() != sessionusers.get(0).getId()) {
					list.get(i).getBasicRemote()
							.sendText(JSONConverter(chatvo.getId(), chatvo.getText(), "message", "event"));
				}
			}
		} else {
			System.out.println("여긴 한명도없다");
		}*/


	/*
	 * private void groupDiv(ChatVO chatvo, Session usersession2) {
	 * if(groupmap.containsKey(chatvo.getGroupno())){ // 그룹넘버가 같을때 처리 boolean
	 * flag = true; List<Session> list = groupmap.get(chatvo.getGroupno());
	 * for(int i =0;i<list.size();i++){ System.out.println(list.get(i).getId());
	 * if(list.get(i).getId() == (usersession2.getId())){ flag = false; } }
	 * if(flag){ groupmap.get(chatvo.getGroupno()).add(usersession2); } }else{
	 * groupmap.put(chatvo.getGroupno(), sessionusers); } }
	 * 
	 * private ChatVO msgTochatvo(String message) { Gson gson = new Gson();
	 * ChatVO chatvo = gson.fromJson(message, ChatVO.class); return chatvo; }
	 */
	/*@OnClose
	public void handleClose(Session session) {
		Set<Integer> k = groupmap.keySet();
		Iterator iter = k.iterator();
		while (iter.hasNext()) {
			System.out.println("반복");
			int i = (int) iter.next();
			if (groupmap.get(i).contains(session)) {
				groupmap.get(i).remove(session);
			}
		}

	}*/
	
	@OnClose
	public void handleClose(Session session){
		sessionusers.remove(session);
	}

	public String JSONConverter(String id, String message, String command, String type) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("id", id);
		jsonObject.put("type", type);
		jsonObject.put("command", command);
		jsonObject.put("message", message);
		return jsonObject.toString();
	}

}
