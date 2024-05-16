import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
                margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),),
                  width: 200,
                
                child: Image.asset('assets/images/chatlo.png'),
              ),
              Text("Scrypt Chat Application",style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 22,
              
                
              ),),
              
               Text('Made in China',
                   
                   style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,
                   
                   ),
              ),

              
              Card(
                margin:const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 10),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration:const InputDecoration(
                            label: Text('Tài khoản Gmail'),
                            
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text('Mật khẩu chỗ này'),
                            
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ],
                    
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