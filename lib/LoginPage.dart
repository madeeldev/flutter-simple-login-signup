import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEEF1F3),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.3,
                child: Icon(
                  (Platform.isIOS) ? CupertinoIcons.heart_fill : Icons.android,
                  size: 100,
                  color: Color(0xff233743),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(22),
                        child: Text('Log-in',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoSerif'
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.9,
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Email', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Your email id',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        width: size.width * 0.9,
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Password', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                            TextFormField(
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: 'Your password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.remove_red_eye : Icons.visibility_off_outlined,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: size.width * 0.82,
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forget password?',
                          style: TextStyle(color: Color(0xff939393), fontSize: 14, fontWeight: FontWeight.bold,),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Color(0xff233743),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: TextButton(
                          child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20),),
                          onPressed: () => {},
                        ),
                      ),
                      SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account ? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                          Text('Sign-up', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ],
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
