import 'package:cris2/phone_no_page.dart';
import 'package:cris2/signup_page.dart';
import 'package:cris2/welcome_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authentication/auth_firebase.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleSignIn() {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text;

    if (_authController.validateInputs(email: email, password: password)) {
      _authController.signInWithEmailAndPassword(email: email, password: password);
    }
  }

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(

        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.to(()=>WelcomePage());
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ), // ' < ' button on top

        body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: h*0.15,),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Sign into your Account',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey
                        ),
                      ),
                      SizedBox(height: 65,),  //gap above id field
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration (
                              hintText: "E-mail",
                              prefixIcon: Icon(Icons.email, color: Colors.indigo, size: 25,),
                              focusedBorder: OutlineInputBorder (
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide (
                                    color:Colors.black12,
                                    width: 1.5,
                                  ) // BorderSide
                              ),
                              enabledBorder: OutlineInputBorder (
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide (
                                      color:Colors.black12,
                                      width: 2.0
                                  )
                              ),
                              border: OutlineInputBorder (
                                  borderRadius: BorderRadius. circular (30)
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                            controller: _passwordController,
                            obscureText: true, // This hides the entered text.
                            decoration: InputDecoration (
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.indigo, size: 25,),
                                focusedBorder: OutlineInputBorder (
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide (
                                      color:Colors.black12,
                                      width: 1.5,
                                    ) // BorderSide
                                ),
                                enabledBorder: OutlineInputBorder (
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide (
                                        color:Colors.black12,
                                        width: 2.0
                                    )
                                ),
                                border: OutlineInputBorder (
                                    borderRadius: BorderRadius. circular (30)
                                )
                            )
                        ),
                      ),
                      SizedBox(height: 20,),  // gap above forget pass
                      Row(
                        children: [
                          Expanded(child: Container(),),
                          Text(
                            'Forgot Password ?',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35,),
                Container(
                  margin: const EdgeInsets.only(left: 100, right: 100),
                  // width: w,
                  child: Container(
                      width: w*0.35,
                      height: h*0.06,
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
                        onPressed: _handleSignIn,
                        child: Text('Sign IN',
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
                SizedBox(height: 15,),
                Text(
                  'OR',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87
                  ),
                ),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                      text: "Sign in using Phone No.",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        // fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>PhoneNoPage())
                  ),
                ),
                SizedBox(height: w*0.12), //gap below sign in
                RichText(text:
                TextSpan(
                    text: "Don't have an Account?",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18
                    ),
                    children: [
                      TextSpan(
                          text: " Create",
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            // fontWeight: FontWeight.w800
                          ),
                          recognizer: TapGestureRecognizer()..onTap=()=>Get.offAll(()=>SignUpPage())
                      ),
                    ]
                )
                )
              ],

            )
        )
    );
  }
}