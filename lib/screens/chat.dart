import 'package:flutter/cupertino.dart';
import 'package:websocket_chat/services/chat.dart';
import '../widgets/chatWindow.dart';
import '../widgets/message.dart';
import '../widgets/input.dart';

class Chat extends StatefulWidget {
  Chat({Key key, @required this.chatService}) : super(key: key);

  final List<Message> messages = <Message>[];
  final ChatService chatService;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  void addMessage(dynamic text) {
    widget.messages.add(Message(text: text));
    print('Message added! You should see it on the screen now');
  }

  @override
  void initState() {
    super.initState();
    // Not sure if this is a good way to do this or not
    widget.chatService.startService(addMessage);
  }

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