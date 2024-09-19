import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../widgets/topSectionProfile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? _frontImage;
  File? _backImage;

  Future<void> _pickFrontImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _frontImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickBackImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _backImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double paddingHorizontal =
        screenWidth * 0.04; // 4% of screen width for horizontal padding

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Ensures column content is aligned left
          children: [
            TopSectionProfile(
                screenWidth: screenWidth, screenHeight: screenHeight),

            // Main content section (Your Packages and Services)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      paddingHorizontal), // Responsive horizontal padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: screenHeight *
                          0.04), // 4% of screen height for spacing
                  const Text(
                    'Upload ID Card Image',
                    style: TextStyle(
                      color: Color(0xFF583EF2),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                      height: screenHeight *
                          0.02), // 2% of screen height for spacing
                  const Text(
                    'Front side',
                    style: TextStyle(
                      color: Color(0xFF1E116B),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                      height: screenHeight *
                          0.01), // 1% of screen height for spacing
                  GestureDetector(
                    onTap: _pickFrontImage,
                    child: Container(
                      width:
                          screenWidth * 0.25, // 25% of screen width for image
                      height: screenWidth * 0.25, // Maintain square shape
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth * 0.01),
                          topRight: Radius.circular(screenWidth * 0.16),
                          bottomLeft: Radius.circular(screenWidth * 0.16),
                          bottomRight: Radius.circular(screenWidth * 0.16),
                        ),
                        color: const Color(0xffffffff),
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: const Color(0xffEAEAFF),
                          width: 1.5,
                        ),
                        image: _frontImage != null
                            ? DecorationImage(
                                image: FileImage(_frontImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: _frontImage == null
                          ? Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.grey,
                              size: screenWidth *
                                  0.1, // Adjust icon size relative to screen width
                            )
                          : null,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Text(
                    'Back side',
                    style: TextStyle(
                      color: Color(0xFF1E116B),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  GestureDetector(
                    onTap: _pickBackImage,
                    child: Container(
                      width: screenWidth * 0.25,
                      height: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: const Color(0xffEAEAFF),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth * 0.01),
                          topRight: Radius.circular(screenWidth * 0.16),
                          bottomLeft: Radius.circular(screenWidth * 0.16),
                          bottomRight: Radius.circular(screenWidth * 0.16),
                        ),
                        image: _backImage != null
                            ? DecorationImage(
                                image: FileImage(_backImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: _backImage == null
                          ? Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.grey,
                              size: screenWidth * 0.1, // Adjust icon size
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: screenHeight * 0.1), // 10% of screen height for spacing
            Center(
              child: SizedBox(
                width:
                    screenWidth * 0.80, // Button width at 80% of screen width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/paymentinfo');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02), // Responsive padding
                    backgroundColor: const Color(0xFF583EF2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          screenWidth * 0.04), // Responsive corner radius
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
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
