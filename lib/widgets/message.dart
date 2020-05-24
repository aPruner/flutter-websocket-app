import 'package:flutter/cupertino.dart';

class Message extends StatelessWidget {
  Message({@required this.text});

  // TODO: Add other data to the message (username, etc)
  final String text;

  Widget build(BuildContext build) {
    return Text(text);
  }
}