import 'package:chat_app/widgets/messenger_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ChatMessenger extends StatefulWidget{
  const ChatMessenger({super.key});
  @override
  State<ChatMessenger> createState() {
    // TODO: implement createState
    return _ChatMessengerState();
  }
}

class _ChatMessengerState extends State<ChatMessenger>{
  


  @override
  Widget build(BuildContext context) {
    final authenUser = FirebaseAuth.instance.currentUser!;
    
    return StreamBuilder(stream: FirebaseFirestore.instance.collection('chat_collection').orderBy('createdAt',descending: true).snapshots(),
     builder: (ctx, chatSnapshots){
      if(chatSnapshots.connectionState == ConnectionState.waiting){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if(!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty){
        return const Center(
          child: Text("Thư mục rỗng [[ ]]"),
        );
      }
      if(chatSnapshots.hasError){
        return const Center(child: Text("Có lỗi kĩ thuật"),);
      }
      final loadMess = chatSnapshots.data!.docs;
      // Set to Chat Screen where user Bubble, logic
      return ListView.builder(
        padding: EdgeInsets.only(bottom: 30, left: 10, right: 10),
        reverse: true,
        itemCount: loadMess.length,

        
        itemBuilder: (ctx, index){
        final chatMessage = loadMess[index].data();
        final nextMessage = index + 1 < loadMess.length ? loadMess[index +1].data() : null;
 
        final currentMessUserId = chatMessage['userID'];
        final nextMessUserId = nextMessage != null ? nextMessage['userID'] : null;

        final nextUserIsSame = nextMessUserId == currentMessUserId;

        if(nextUserIsSame){
          return MessageBubble.next(message: chatMessage['text'], isMe: authenUser.uid == currentMessUserId );
        }else{
          return MessageBubble.first(imageUser: chatMessage['imageUser'], username: chatMessage['username'], message: chatMessage['text'], isMe: authenUser.uid == currentMessUserId);
        }
      });


     });
    
  }}