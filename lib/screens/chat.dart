import 'package:flutter/cupertino.dart';
import '../widgets/chatWindow.dart';
import '../widgets/message.dart';
import '../widgets/input.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  final List<Message> messages = <Message>[];

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext build) {
    return Column (
      children: [
        ChatWindow(messages: widget.messages),
        Input()
      ]
    );
  }
}