
import 'package:chat_app/screens/auth.dart';
import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return SplashScreen();
        }
        if(snapshot.hasData){
          return ChatScreen();
        }
        return const AuthScreen();

      })
    );
  }
}
