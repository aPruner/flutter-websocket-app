import 'package:flutter/material.dart';

void main() => runApp(WebsocketApp());

class WebsocketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          )
        ),
      ),
    );
  }

}