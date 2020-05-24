import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  Input({Key key, @required this.sendMessage}) : super(key: key);

  final Function sendMessage;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  // TODO: figure out how this works and if I need it
  final _formKey = GlobalKey<FormState>();

  String _value = '';

  void _onChanged(String value) {
    // Not sure if this works or not
    setState(() => _value = value);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Send a message!',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: _onChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RaisedButton(
              onPressed: () {
                // TODO: Figure out if this validation is useful or not
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  widget.sendMessage(_value);
                }
              },
              child: Text('Send message'),
            ),
          ),
        ]
      )

    );
  }
}