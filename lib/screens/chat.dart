
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Meeting'),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();

          }, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Text('ok'),
      ),
    );
  }
}