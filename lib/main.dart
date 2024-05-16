
import 'package:chat_app/screens/auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat Room",
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor:Color.fromRGBO(233, 238, 233, 1), onPrimary: Color.fromRGBO(233, 238, 233, 1),),
      ),
      home: AuthScreen(),
    );
  }
}
