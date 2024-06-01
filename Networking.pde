/**import websockets.*;

class Network{
  
  WebsocketServer ws;
  int now;
  float x,y;

  void pre(){
    //Initiates the websocket server, and listens for incoming connections on ws://localhost:8025/john
    ws= new WebsocketServer(this,5204,"/john");
    now=millis();
    x=0;
    y=0;
  
  }
  
  void send(){
  
    if(millis()>now+5000){
      ws.sendMessage("Server message");
      now=millis();
    }
  
  }
  //If you chose to use it, it will be executed whenever a client sends a message
  void webSocketServerEvent(String msg){
     println(msg);
     x=random(width);
     y=random(height);
  }



}

**/
