import '../utils//websocket.dart';

class ChatService {
  // TODO: Maybe messages array just lives in the service? decide on design
  Websocket websocket;

  ChatService(String serverHostname, String serverPort) {
    websocket = Websocket(serverHostname, serverPort);
  }

  void startService(Function onMessageReceived) {
    // TODO: Error handling, for now it will crash and burn
    websocket.connectToServer();
    websocket.listenForMessages(onMessageReceived);
  }

  void sendMessage() {
    // TODO: send a message
  }

}