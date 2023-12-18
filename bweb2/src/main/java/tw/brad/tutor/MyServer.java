package tw.brad.tutor;

import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/myserver")
public class MyServer {
	private static HashSet<Session> sessions;
	private static HashMap<String, Session> users;
	
	public MyServer() {
		if (sessions == null) {
			sessions = new HashSet<Session>();
			users = new HashMap<String, Session>();
		}
	}
	
	@OnOpen
	public void onOpen(Session session) {
		System.out.println("onOpen:" + session.getId());
		if (sessions.add(session)) {
			users.put(session.getId(), session);
			session.setMaxIdleTimeout(3*60*1000);
		}
		System.out.println("Count: " + sessions.size());
	}
	
	@OnClose
	public void onClose(Session session) {
		users.remove(session.getId());
		sessions.remove(session);
		System.out.println("Count: " + sessions.size());		
	}
	
	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println(session.getId() + ":" + message);
		
		for (Session s : sessions) {
			try {
				s.getBasicRemote().sendText(message);				
			} catch (IOException e) {
				System.out.println(e);
			}
		}
		
		//users.get(session.getId()).getBasicRemote().sendText(message);
	}
	
}
