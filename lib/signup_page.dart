import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  bool _obscureText = true;
  File? _profileImage;

  final _signupFormKey = GlobalKey<FormState>();

  Future _pickProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(() => _profileImage = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.3,
                  child: Image.asset('assets/images/friendship.png'),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(22),
                        child: const Text('Sign-up',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoSerif'
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 130,
                        height: 130,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: _pickProfileImage,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade400,
                                      border: Border.all(color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_sharp,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                              child: Text('Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Your name',
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (textValue) {
                                if(textValue == null || textValue.isEmpty) {
                                  return 'Name field is required!';
                                }
                                return null;
                              },
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
                              child: Text('Email', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Your email id',
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (textValue) {
                                if(textValue == null || textValue.isEmpty) {
                                  return 'Email is required!';
                                }
                                if(!EmailValidator.validate(textValue)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
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
                              child: Text('Contact no.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                isDense: true,
                                hintText: 'Your contact number',
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (textValue) {
                                if(textValue == null || textValue.isEmpty) {
                                  return 'Contact number is required!';
                                }
                                return null;
                              },
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
                                isDense: true,
                                hintText: 'Your password',
                                suffixIconConstraints: const BoxConstraints(
                                    maxHeight: 33
                                ),
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
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (textValue) {
                                if(textValue == null || textValue.isEmpty) {
                                  return 'Password is required!';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22,),
                      Container(
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: const Color(0xff233743),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: TextButton(
                          onPressed: _handleSignupUser,
                          child: const Text('Signup', style: TextStyle(color: Colors.white, fontSize: 20),),
                        ),
                      ),
                      const SizedBox(height: 18,),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Already have an account ? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                            GestureDetector(
                              onTap: () => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()))
                              },
                              child: const Text('Log-in', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSignupUser() {
    // signup user
    if (_signupFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting data..')),
      );
    }
  }
}
