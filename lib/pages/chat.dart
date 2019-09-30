import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

  final String title;
  ChatPage(this.title);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}