import 'package:flutter/material.dart';
import 'package:login_signup/signup_page.dart';

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
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffEEF1F3),
          body: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * 0.3,
                child: Image.asset('assets/images/friendship.png'),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
                          child: const Text('Log-in',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoSerif'
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * 0.9,
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Email', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Your email id',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16,),
                        Container(
                          width: size.width * 0.9,
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Password', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
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
                        const SizedBox(height: 16,),
                        Container(
                          width: size.width * 0.80,
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Forget password?',
                            style: TextStyle(
                              color: Color(0xff939393),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: const Color(0xff233743),
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: TextButton(
                            child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 20),),
                            onPressed: () => {},
                          ),
                        ),
                        const SizedBox(height: 18,),
                        SizedBox(
                          width: size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account ? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()))
                                },
                                child: const Text('Sign-up', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
