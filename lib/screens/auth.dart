import 'dart:io';

import 'package:chat_app/widgets/user_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _enterEmail = '';
  var _enterPass = '';
  File? _image;
  var _isLoading = false;

  void _submit() async {
    final isSubmit = _formKey.currentState!.validate();

    if (!isSubmit || !_isLogin && _image == null) {
      return;
    }
    _formKey.currentState!.save();
    try {
      setState(() {
        _isLoading = true;
      });
      if (_isLogin) {
        // log User in
        final userCredential = await _firebase.signInWithEmailAndPassword(
            email: _enterEmail, password: _enterPass);
      } else {
        final userCridential = await _firebase.createUserWithEmailAndPassword(
            email: _enterEmail, password: _enterPass);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Đăng ký được rồi đấy.')));
        final storageRef = FirebaseStorage.instance
            .ref()
            .child("user_images")
            .child('${userCridential.user!.uid}.jpg');

        await storageRef.putFile(_image!);
        final imageURL = await storageRef.getDownloadURL();
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {}

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? "Authentication Fail")));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 10, right: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                width: 170,
                child: Image.asset('assets/images/chatlo.png'),
              ),
              Text(
                "Scrypt Chat Application",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 22,
                ),
              ),
              const Text(
                'Made in China',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                margin: const EdgeInsets.only(
                    top: 30, right: 30, left: 30, bottom: 10),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          if (!_isLogin)
                            UserImagePicker(
                              onPickImage: (avatarImage) {
                                _image = avatarImage;
                              },
                            ),
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text('Tài khoản Gmail'),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return "Enter the format Gmail";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enterEmail = value!;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text('Mật khẩu chỗ này'),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  value.trim().length <= 6) {
                                return "Enter password correctly format";
                              }
                              return null;
                            },
                            onSaved: (value) => _enterPass = value!,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if(_isLoading)
                            const CircularProgressIndicator(),
                          if (!_isLoading)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                              onPressed: () {
                                _submit();
                              },
                              child: Text(_isLogin ? 'Đăng nhập' : 'Đăng ký'),
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (!_isLoading)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                _isLogin
                                    ? 'Tạo tài khoản mới cho tôi'
                                    : 'Bạn đã có tài khoản rồi à',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
