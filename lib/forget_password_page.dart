import 'package:flutter/material.dart';
import 'package:login_signup/login_page.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEEF1F3),
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
                        child: const Text('Forgot password',
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
                                isDense: true,
                                hintText: 'Your email id',
                              ),
                            ),
                          ],
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
                          child: const Text('Submit', style: TextStyle(color: Colors.white, fontSize: 20),),
                          onPressed: () => {},
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()))
                          },
                          child: const Text(
                            'Back to login',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff939393),
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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
