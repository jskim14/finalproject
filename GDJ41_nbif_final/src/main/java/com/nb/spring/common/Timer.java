package com.nb.spring.common;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

public class Timer extends Thread{
	
	private Map<String,WebSocketSession> clients = new HashMap<String,WebSocketSession>();
	
	public Timer(Map<String,WebSocketSession> clients) {
		this.clients = clients;
	}
	@Override
	public void run(){
		Iterator<String> keys = clients.keySet().iterator();
		while(keys.hasNext()) {
			String key = keys.next();
			WebSocketSession ss = clients.get(key);
			try {
				ss.sendMessage(new TextMessage("경매끝!"));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
