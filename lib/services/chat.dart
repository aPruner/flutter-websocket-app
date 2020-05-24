import '../utils/websocket.dart';

class ChatService {
  // TODO: Maybe messages array should just live in the service? decide on design
  Websocket websocket;

  ChatService(String serverHostname, String serverPort) {
    websocket = Websocket(serverHostname, serverPort);
  }

  void startService(void onMessageReceived(String message)) {
    // TODO: Error handling, for now it will crash and burn
    websocket.listenForMessages(onMessageReceived);
  }

  void sendMessage(String message) {
    websocket.sendMessage(message);
  }
}