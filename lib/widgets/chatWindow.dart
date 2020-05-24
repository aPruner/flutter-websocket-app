import 'package:flutter/cupertino.dart';
import 'message.dart';

class ChatWindow extends StatelessWidget {
  const ChatWindow({@required this.messages}) : super();

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: messages
      )
    );
  }
}