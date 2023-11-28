import 'package:cris2/login_page.dart';
import 'package:cris2/welcome_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authentication/auth_firebase.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {

  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


  void _handleSignUp() {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (!_authController.validateInputs(email: email, password: password)) {
      return; // Validation failed, don't proceed with registration
    }

    if (password != confirmPassword) {
      // Password and confirm password do not match, show an error message
      Get.snackbar('Check again', 'Passwords do not match.');
      return;
    }

    _authController.registerWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.to(() => WelcomePage());
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ),

        body: SingleChildScrollView(child:
        Column(
          children: [
            SizedBox(height: h * 0.05,),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ), // avatar
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: "User Name",
                            prefixIcon: Icon(
                              Icons.account_circle_sharp, color: Colors.indigo,
                              size: 25,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1.5,
                                ) // BorderSide
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "E-mail",
                            prefixIcon: Icon(
                              Icons.email, color: Colors.indigo, size: 25,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1.5,
                                ) // BorderSide
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.lock_outlined, color: Colors.indigo,
                              size: 25,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1.5,
                                ) // BorderSide
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true, // Hide the password
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded, color: Colors.indigo,
                              size: 25,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                  width: 1.5,
                                ) // BorderSide
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.black12,
                                    width: 2.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70,), //gap above sign up
            Container(
              margin: const EdgeInsets.only(left: 90, right: 90),
              width: w,
              child: Container(
                  width: w * 0.5,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.25)
                        )
                      ]
                  ),
                  child: ElevatedButton(
                    onPressed: _handleSignUp,
                    child: Text('Create Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                    ),
                  )
              ),
            ),
            SizedBox(height: w * 0.08,),
            Container(
              width: w,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.offAll(LoginPage()),
                    text: "Already Have an Account ? Login",
                    style: TextStyle(
                      color: Colors.indigo,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
        )
    );
  }
}


