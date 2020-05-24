import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'json.dart';

class Websocket {
  IOWebSocketChannel channel;
  String serverHostname;
  String serverPort;

  Websocket(String serverHostname, String serverPort) {
    this.serverHostname = serverHostname;
    this.serverPort = serverPort;
  }

  void connectToServer() async {
    // TODO: error handling, for now it will crash and burn
    channel = IOWebSocketChannel.connect('ws://$serverHostname:$serverPort/ws/chat');
  }

  void disconnectFromServer() {
    // TODO: error handling, for now it will crash and burn
    channel.sink.close(status.goingAway);
  }

  void listenForMessages(void callback(message)) {
    // TODO: error handling, for now it will crash and burn
    channel.stream.listen(callback);
  }

  void sendMessage(String message) {
    // TODO: error handling, for now it will crash and burn
    channel.sink.add(Json.encodeMessageJSON(message));
  }
}