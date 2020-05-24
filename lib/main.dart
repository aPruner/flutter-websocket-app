import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/chat.dart';
import 'services/chat.dart';

Future main() async {
  await DotEnv().load();
  runApp(WebsocketApp());
}

class WebsocketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Decide if screens should create and hook into their own services instead
    // Create and hook services into the app
    ChatService chatService = ChatService(getServerHostname(), getServerPort());
    return MaterialApp(
      title: 'Websocket Chat Room',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Websocket Chat Room'),
        ),
        body: Container(
          child: Chat(chatService: chatService)
        ),
      ),
    );
  }

  String getServerHostname() {
    return DotEnv().env['SERVER_HOSTNAME'];
  }

  String getServerPort() {
    return DotEnv().env['SERVER_PORT'];
  }
}