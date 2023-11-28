import 'package:cris2/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'authentication/auth_firebase.dart';
import 'otp_validation.dart';

class PhoneNoPage extends StatefulWidget {
  const PhoneNoPage({Key? key}) : super(key: key);

  @override
  State<PhoneNoPage> createState() => _PhoneNoPageState();
}

class _PhoneNoPageState extends State<PhoneNoPage> {

  TextEditingController countrycode= TextEditingController();
  TextEditingController phoneController = TextEditingController();


  @override
  void initState(){
    countrycode.text="+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.to(() => LoginPage());
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ),
        body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: h*0.15,),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.white24,
                        radius: 80,
                        backgroundImage: AssetImage("img/otplogo.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    width: w,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Center(
                        child: Text(
                          'Enter your Phone No.',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 55,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    width: w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 40,
                          child: TextField(
                            controller: countrycode,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        Text(
                          '|',
                          style: TextStyle(
                            fontSize: 33,
                            color: Colors.black38,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Phone',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 100, right: 100),
                    width: w,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Get the phone number input from the user
                        String phoneNumber =
                            countrycode.text + phoneController.text;

                        try {
                          await AuthController().verifyPhoneNumber(
                            phoneNumber: phoneNumber,
                            onVerificationCompleted: () {
                              // Handle verification completed (auto-retrieval of OTP)
                            },
                            onVerificationFailed: (error) {
                              // Handle verification failed
                              print('Verification failed: $error');
                            },
                            onCodeSent: (verificationId, resendToken) {
                              // Navigate to the validation screen and pass the verification ID
                              Get.off(() =>
                                  ValidationPage(verificationId: verificationId));
                            },
                          );
                        } catch (error) {
                          // Handle errors, e.g., invalid phone number format
                          print('Check the number: $error');
                        }
                      },
                      child: Text(
                        'Send Code',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                  ),
                ],
              ),
            )));
  }
}
