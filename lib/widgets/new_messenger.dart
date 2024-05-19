import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessenger extends StatefulWidget {
  const NewMessenger({super.key});
  @override
  State<NewMessenger> createState() {
    return _NewMessengerState();
  }
}

class _NewMessengerState extends State<NewMessenger> {

  final _messController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _messController.dispose();

    super.dispose();
  }

  void _submitMessage() async{

    final mess = _messController.text;
    if(mess.trim().isEmpty){
      return;
    }
    // if FocusScope put here , it will be better 


    final user = FirebaseAuth.instance.currentUser!;
    final userData =await FirebaseFirestore.instance.collection('user_list').doc(user.uid).get();

    FirebaseFirestore.instance.collection('chat_collection').add({
      'userID': user.uid,
      'imageUser': userData.data()!['image_url'],
      'username': userData.data()!['username'],
      'text': mess,
      'createdAt' : Timestamp.now(),
    });
    FocusScope.of(context).unfocus();
    _messController.clear();
    
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 2,
        bottom: 10,
      ),
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: _messController ,
            textCapitalization: TextCapitalization.sentences,
            enableSuggestions: true,
            autocorrect: true,
            decoration: InputDecoration(label: Text('Gửi tin nhắn ...'),),
          
          ),
        ),
        IconButton(onPressed: _submitMessage,
         icon: Icon(Icons.send),),
      ],),
    );
  }
}
