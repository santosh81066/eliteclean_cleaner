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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Ensures column content is aligned left
        children: [
          TopSectionProfile(
              screenWidth: screenWidth, screenHeight: screenHeight),

          // Main content section (Your Packages and Services)
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal:
                    16), // Adds padding to bring text away from the edges
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Upload ID Card Image',
                  style: TextStyle(
                    color: Color(0xFF583EF2),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Front side',
                  style: TextStyle(
                    color: Color(0xFF1E116B),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickFrontImage,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(64),
                        bottomLeft: Radius.circular(64),
                        bottomRight: Radius.circular(64),
                      ),
                      color: const Color(0xffffffff),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Color(0xffEAEAFF),
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
                        ? const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey,
                            size: 40,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Back side',
                  style: TextStyle(
                    color: Color(0xFF1E116B),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickBackImage,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Color(0xffEAEAFF),
                        width: 1.5,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(64),
                        bottomLeft: Radius.circular(64),
                        bottomRight: Radius.circular(64),
                      ),
                      image: _backImage != null
                          ? DecorationImage(
                              image: FileImage(_backImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _backImage == null
                        ? const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey,
                            size: 40,
                          )
                        : null,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 125,
          ),
          Center(
            child: SizedBox(
              width: screenWidth * 0.80,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/paymentinfo');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF583EF2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
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
    );
  }
}
