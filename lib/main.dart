import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await DotEnv().load();
  print(DotEnv().env['SERVER_HOSTNAME']);
  runApp(WebsocketApp());
}

class WebsocketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    connectToWebsocket();
    return MaterialApp(
      title: 'My Websocket Chat App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Websocket Chat App'),
        ),
        body: Container(
          child: Column(
            children: [
              Text('This is text widget 1'),
              Text('This is text widget 2'),
              Text('This is text widget 3'),
            ]
          ),
        ),
      ),
    );
  }

  void connectToWebsocket() async {
    String serverHostname = getServerHostname();
    IOWebSocketChannel channel = IOWebSocketChannel.connect('ws://$serverHostname:4000/ws/chat');
  
    print('flutter app connected to the server');

    channel.stream.listen((message) {
      print('message received from server!');
      print(message);
    });
  }

  String encodeMessage(message) {
    return jsonEncode({
      'data': {
        'message': message
      }
    });
  }

  String getServerHostname() {
    return DotEnv().env['SERVER_HOSTNAME'];
  }
}