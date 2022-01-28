package com.nb.spring.common.websocket;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class RealTimeActionServer extends TextWebSocketHandler {

//	private List<WebSocketSession> clients = new ArrayList<WebSocketSession>();
	private Map<String,WebSocketSession> clients = new HashMap<String,WebSocketSession>();
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(clients.size());
		System.out.println(message.getPayload());
		message.getPayload();
//		for(WebSocketSession ss : clients) {
//			ss.sendMessage(message);
//		}
		Iterator<String> keys = clients.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
			WebSocketSession ss = clients.get(key);
			ss.sendMessage(message);
		}
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		clients.put(session.getId(),session);
		Iterator<String> keys = clients.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
			WebSocketSession ss = clients.get(key);
			ss.sendMessage(new TextMessage("" + clients.size()));
		}
//		if(clients.size()<=0) {
//		}
//		else {
//			for(int i=0; i<clients.size(); i++) {
//				if(clients.get(i).getId() != null && clients.get(i).getId()!=session.getId()) {
//					clients.add(session);
//				}
//			}
//		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		clients.remove(session.getId());
		Iterator<String> keys = clients.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
			WebSocketSession ss = clients.get(key);
			ss.sendMessage(new TextMessage("" + clients.size()));
		}
	}
	
}
