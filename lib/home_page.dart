import 'package:cris2/my_profile.dart';
import 'package:cris2/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          children: [
            Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  Get.offAll(WelcomePage());
                },
                icon: Column(
                  children: [
                    Icon(Icons.logout_rounded,),
                    Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),
                    )
                  ],
                )

            ),
          ],
        ),
      ),

      body: Container(
          child: Center(
            child: Text(
              'Employee Dashboard',
              style: TextStyle(
                  fontSize: 25
              ),
            ),
          )
      ),

      drawer: Drawer(
        // Define your side navigation menu here
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
                accountName: Padding(
                  padding: EdgeInsets.fromLTRB(10,0,0,0),
                  child: Text(
                    'User\'s Name',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                accountEmail: Padding(
                  padding: EdgeInsets.fromLTRB(10,0,0,0),
                  child: Text(
                    'User\'s E-mail ID',
                    style: TextStyle(
                        fontSize: 15
                    ),
                  ),
                ),
                currentAccountPicture: Padding(
                  padding: EdgeInsets.fromLTRB(10,0,0,0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person),
                  ),
                )
            ),
            // ListTile(
            //   leading: Icon(Icons.account_circle_rounded, color: Colors.indigo,),
            //   title: Text('My Profile'),
            //   onTap: () {
            //     // Handle the Home menu item tap
            //     Navigator.pop(context); // Close the drawer
            //     Get.to(MyProfile());
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.indigo,),
              title: Text('Settings'),
              onTap: () {
                // Handle the Settings menu item tap
                Navigator.pop(context); // Close the drawer
                // Implement the action you want when Settings is selected
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded, color: Colors.indigo,),
              title: Text('Sign Out'),
              onTap: () {
                // Handle the Settings menu item tap
                Navigator.pop(context); // Close the drawer
                Get.offAll(WelcomePage());
              },
            ),
            // Add more ListTile widgets for other menu items
          ],
        ),
      ),
    );
  }
}