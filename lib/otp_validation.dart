import 'package:cris2/phone_no_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'authentication/auth_firebase.dart';
import 'home_page.dart';

class ValidationPage extends StatefulWidget {

  final String verificationId;
  const ValidationPage({super.key, required this.verificationId});

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}
class _ValidationPageState extends State<ValidationPage>{

  final TextEditingController pinController = TextEditingController();
  String errorText = '';

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    var code="";
    return Scaffold(
        resizeToAvoidBottomInset: true,

        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 50,
            ),
          ),
        ),

        body: Container(
          child: Column(
            children: [
              SizedBox(height: h*0.15,),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.white24,
                    radius: 80,
                    backgroundImage: AssetImage(
                        "img/otplogo.png"
                    ),
                  ),
                ),
              ),
              SizedBox(height: h*0.10,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Verification',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                ),
              ),
              SizedBox(height: 40,),
              Pinput(
                length: 6,
                controller: pinController,
              ),
              SizedBox(height: 10,),
              GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Resend code  ',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
              ),
              SizedBox(height: 50,),
              Container(
                margin: const EdgeInsets.only(left: 110, right: 110),
                width: w,
                child: ElevatedButton(
                  onPressed: () async {
                    // Get the OTP input from the user
                    String verificationCode = pinController.text;

                    if (verificationCode.isEmpty) {
                      setState(() {
                        errorText = 'Please enter the OTP';
                      });
                    } else {
                      setState(() {
                        errorText = '';
                      });

                      try {
                        await AuthController().signInWithOTP(
                          verificationId: widget.verificationId,
                          verificationCode: verificationCode,
                        );
                        // If the OTP verification is successful, navigate to the home page
                        Get.offAll(HomePage());
                      } catch (error) {
                        // Handle OTP verification error
                        print('Error verifying OTP: $error');
                        setState(() {
                          errorText = 'Incorrect OTP. Please try again.';
                        });
                      }
                    }
                  },
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                  onTap: () {
                    Get.offAll(() => PhoneNoPage());
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Edit Number ?',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}