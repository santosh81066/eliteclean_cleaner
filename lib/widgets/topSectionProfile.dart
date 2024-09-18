import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // To handle File

class TopSectionProfile extends StatefulWidget {
  const TopSectionProfile({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  _TopSectionProfileState createState() => _TopSectionProfileState();
}

class _TopSectionProfileState extends State<TopSectionProfile> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple header section
        Container(
          width: widget.screenWidth,
          height: widget.screenHeight * 0.30,
          decoration: const BoxDecoration(
            color: Color(0xFF6D6BE7),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const Text(
                        'Upload profile image',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: 100, // Adjust the width
                          height: 100, // Adjust the height
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(64),
                              bottomLeft: Radius.circular(64),
                              bottomRight: Radius.circular(64),
                            ),
                            color: Colors
                                .grey[200], // Background color of the container
                            image: _image != null
                                ? DecorationImage(
                                    image: FileImage(_image!),
                                    fit: BoxFit.cover,
                                  )
                                : null, // Display the image if selected
                          ),
                          child: _image == null
                              ? const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.grey,
                                  size: 40,
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
