window.onload = function(){
	var start = document.getElementById("start");
	var mesgDiv = document.getElementById("mesgDiv");
	var mesg = document.getElementById("mesg");
	var send = document.getElementById("send");
	var log = document.getElementById("log");
	
	var webSocket;
	
	start.style.display = "block";
	mesgDiv.style.display = "none";
	
	start.addEventListener("click", function(){
		console.log("connect...");
		connect();
	});
	
	send.addEventListener("click", function(){
		var message = {
			message : mesg.value
		};
		webSocket.send(JSON.stringify(message));
	});
	
	function connect(){
		webSocket = new WebSocket("ws://10.0.104.130:8080/bweb2/myserver");	
		
		webSocket.onerror = function(event){console.log("error")};
		webSocket.onopen = function(event){
			console.log("open ok");
			start.style.display = "none";
			mesgDiv.style.display = "block";
			
		};	
		
		webSocket.onclose = function(event){
			console.log("close ok");
			start.style.display = "block";
			mesgDiv.style.display = "none";
		}
		
		// 接收訊息
		webSocket.onmessage = function(event){
			// event.data
			var mesgObj = JSON.parse(event.data);
			log.innerHTML += mesgObj.message + "<br />";
		}
		
	}
	
	
	
	
}