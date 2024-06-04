import java.net.*;
import java.io.*;
import java.util.Arrays;

DatagramSocket socket;
DatagramPacket packet;

Stirng messsage byte[] buf = new byte[256]; // Set your buffer size as desired

class Network {

  void network() {
    try {
      socket = new DatagramSocket(5005);
      println("Server started on port 5005");

      Thread receiveThread = new Thread(() -> {

        while(true) {
          try {
            DatagramPacket packet = new DatagramPacket(buf, buf.length);
            socket.receive(packet);
            String received = new String(packet.getData(), 0, packet.getLength());

            synchronized(messages) {
              messages.add("Client: " + received);
            }
            println("Received message: " + received);

            // Echo back the received message
            DatagramPacket responsePacket = new DatagramPacket(buf, buf.length, packet.getAddress(), packet.getPort());
            socket.send(responsePacket);
          }

          catch(IOException e) {
            e.printStackTrace();
            println(e.getMessage());
          }
        }
      });
      receiveThread.start();
    }

    catch(Exception e) {
      e.printStackTrace();
      println(e.getMessage());
    }
  }
}
