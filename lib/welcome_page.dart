import 'package:cris2/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.white24,
                radius: 100,
                backgroundImage: AssetImage("img/logo.png"),
              ),
            ),
            SizedBox(height: 35,),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      'Welcome To Indian Railways',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Text(
                  //   'Aapka Swagat Hai',
                  //   style: TextStyle(
                  //     fontSize: 25,
                  //     color: Colors.grey,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  SizedBox(height: 40),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 130,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => LoginPage());
                            },
                            onHover: (True) {
                              ElevatedButton.styleFrom(backgroundColor: Colors.indigo,
                                  foregroundColor: Colors.transparent
                              );
                            },
                            style: ElevatedButton.styleFrom(foregroundColor: Colors.indigo),
                            child: Text('Login',style: TextStyle(fontSize: 17),),
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => SignUpPage());
                            },
                            style: ElevatedButton.styleFrom(foregroundColor: Colors.indigo),
                            child: Text('Sign Up',style: TextStyle(
                              fontSize:17,
                            ),
                            ),
                          ),
                        ),
                      ]
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
