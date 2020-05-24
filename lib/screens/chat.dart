import 'package:flutter/cupertino.dart';
import 'package:websocket_chat/services/chat.dart';
import '../widgets/chatWindow.dart';
import '../widgets/message.dart';
import '../widgets/input.dart';

class Chat extends StatefulWidget {
  Chat({Key key, @required this.chatService}) : super(key: key);

  final ChatService chatService;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  List<Message> _messages = <Message>[];

  void addMessage(dynamic text) {
    _messages.add(Message(text: text));
    List<Message> messages = new List<Message>.from(_messages);
    setState(() => _messages = messages);

    print('messages:');
    print(_messages);
  }

  void sendMessage(message) {
    widget.chatService.sendMessage(message);
  }

  @override
  void initState() {
    super.initState();
    // TODO: Not sure if this is a good way to bind addMessage to the ChatService, look into it
    widget.chatService.startService(addMessage);
  }

  @override
  Widget build(BuildContext build) {
    return Container (
      child: Column(
        children: <Widget>[
          ChatWindow(messages: _messages),
          Input(sendMessage: sendMessage)
        ]
      ),
    );
  }
}