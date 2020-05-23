import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'utils.dart';

Future main() async {
  await DotEnv().load();
  runApp(WebsocketApp());
}

class WebsocketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    connectToWebsocket();
    return MaterialApp(
      title: 'Websocket Chat Room',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Websocket Chat Room'),
        ),
        body: Container(
          child: Column(
            children: [ // TODO: Render a list of messages from the websocket server
              Text('This is text widget 1'),
              Text('This is text widget 2'),
              Text('This is text widget 3'),
            ]
          ),
        ),
      ),
    );
  }

  void listen(channel) async {
    channel.stream.listen((message) {
      print('message received from server!');
      print(message);
    });
  }

  Future connectToWebsocket() async {
    String serverHostname = getServerHostname();
    String serverPort = getServerPort();
    return IOWebSocketChannel.connect('ws://$serverHostname:$serverPort/ws/chat');
  }

  String getServerHostname() {
    return DotEnv().env['SERVER_HOSTNAME'];
  }

  String getServerPort() {
    return DotEnv().env['SERVER_PORT'];
  }
}