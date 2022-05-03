import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{
  final String name;
  ChatScreen ({required this.name});
  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State <ChatScreen>{
  final TextEditingController _textController = new TextEditingController();

  void _handledSubmit(String text){
    print(text);
  }

  Widget _buildTextComposer(){

    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              controller: _textController,
            ),
          ),
          new Container(
            child: new IconButton(
                onPressed: () => _handledSubmit(_textController.text),
                icon: new Icon(Icons.send)),
          )
        ],
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar : new AppBar(
          title: new Text(widget.name),
      ),
    body: new Container(
      child: new Column(
        children: <Widget>[
          new Divider(height: 1.0),
          new Container(
            child: _buildTextComposer(),
          )
        ],
      ),
    ),
    );
  }
}