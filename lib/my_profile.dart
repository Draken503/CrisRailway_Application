import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cris2/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  final FirebaseFirestore _firestoreService = FirebaseFirestore.instance;


  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _employeeIdController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _employeeAddressController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _dateOfJoiningController = TextEditingController();

  // Define a variable to hold the user's selected image.
  // Initialize it with a default image or null if no image is selected.
  ImageProvider<Object>? _userImage; // Use the correct ImageProvider type

  // Function to open the image picker and select a new image.
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        // Update the user's selected image.
        _userImage = FileImage(File(pickedImage.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Complete Your Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: 150),
                Center(
                  child: Container(
                    width: 120, // Set the desired width for the photo container
                    height: 120, // Set the desired height for the photo container
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.indigo,
                      // You can set a default background color
                      image: DecorationImage(
                        image: _userImage ?? AssetImage('img/default img.png'),
                        // Use the selected image or a default image
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: -3,
                            // Adjust this value to position the '+' symbol
                            right: -3,
                            // Adjust this value to position the '+' symbol
                            child: IconButton(
                              onPressed: _pickImage,
                              icon: Icon(
                                Icons.add_circle,
                                size: 30,
                              ),
                              color: Colors.indigo,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        TextFormField(
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'First Name',
                                labelStyle: TextStyle(color: Colors.indigo))
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        TextFormField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Last Name',
                                labelStyle: TextStyle(color: Colors.indigo)
                            )),
                        SizedBox(
                          height: 17,
                        ),
                        TextFormField(
                            controller: _employeeIdController,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Employee Id',
                                labelStyle: TextStyle(color: Colors.indigo)
                            )),
                        SizedBox(
                          height: 17,
                        ),
                        TextFormField(
                            controller: _mobileNumberController,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Mobile Number',
                                labelStyle: TextStyle(color: Colors.indigo)
                            )),
                        SizedBox(
                          height: 17,
                        ),
                        TextFormField(
                            controller: _emailAddressController,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Email Address',
                                labelStyle: TextStyle(color: Colors.indigo)
                            )),
                        SizedBox(
                          height: 17,
                        ),
                        TextFormField(
                            controller: _genderController,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Gender',
                                labelStyle: TextStyle(color: Colors.indigo)
                            )),
                        SizedBox(
                          height: 17,
                        ),
                        TextFormField(
                            controller: _employeeAddressController,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Employee Address',
                                labelStyle: TextStyle(color: Colors.indigo))),
                        SizedBox(
                          height: 17,
                        ),
                        TextFormField(
                            controller: _dateOfBirthController,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Date Of Birth',
                                labelStyle: TextStyle(color: Colors.indigo)
                            )),
                        SizedBox(
                          height: 17,
                        ),
                        TextFormField(controller: _dateOfJoiningController,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Date Of Joining',
                                labelStyle: TextStyle(color: Colors.indigo)
                            )),
                        SizedBox(
                          height: 35,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // Retrieve text from text fields
                            String firstName = _firstNameController.text;
                            String lastName = _lastNameController.text;
                            String employeeId = _employeeIdController.text;
                            String mobileNumber = _mobileNumberController.text;
                            String emailAddress = _emailAddressController.text;
                            String gender = _genderController.text;
                            String employeeAddress = _employeeAddressController.text;
                            String dateOfBirth = _dateOfBirthController.text;
                            String dateOfJoining = _dateOfJoiningController.text;

                            // Check if any of the required fields are null or empty
                            if (firstName.isNotEmpty &&
                                lastName.isNotEmpty &&
                                employeeId.isNotEmpty &&
                                mobileNumber.isNotEmpty &&
                                emailAddress.isNotEmpty &&
                                gender.isNotEmpty &&
                                employeeAddress.isNotEmpty &&
                                dateOfBirth.isNotEmpty &&
                                dateOfJoining.isNotEmpty) {
                              // Create a map to represent the user's profile data
                              Map<String, dynamic> profileData = {
                                'firstName': firstName,
                                'lastName': lastName,
                                'employeeId': employeeId,
                                'mobileNumber': mobileNumber,
                                'emailAddress': emailAddress,
                                'gender': gender,
                                'employeeAddress': employeeAddress,
                                'dateOfBirth': dateOfBirth,
                                'dateOfJoining': dateOfJoining,
                              };
                              try{
                                // Use Firestore to store the user's profile data
                                await _firestoreService.collection('users').doc().set(profileData);

                                // Optionally, you can clear the text fields after storing data
                                // _firstNameController.clear();
                                // _lastNameController.clear();
                                // _employeeIdController.clear();
                                // _mobileNumberController.clear();
                                // _emailAddressController.clear();
                                // _genderController.clear();
                                // _employeeAddressController.clear();
                                // _dateOfBirthController.clear();
                                // _dateOfJoiningController.clear();

                                Get.offAll(() => HomePage());
                              } catch (e) {
                                print('Error saving profile data: $e');
                                // Handle any errors that occur during data saving
                              }
                            }
                            else {
                              Get.snackbar('Please try again', 'Check all the fields');
                            }
                          },
                          child: Text(
                            'Save Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
