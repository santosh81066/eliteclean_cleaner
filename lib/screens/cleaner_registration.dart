import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CleanerRegistration extends StatelessWidget {
  const CleanerRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.1), // Space from top to the logo

              // Logo at the top
              SvgPicture.asset(
                'assets/images/logo-icon.svg', // Path to your SVG file
                fit: BoxFit.contain, // Adjust fit as needed
              ),

              const SizedBox(height: 16),

              // "Sign up" text
              const Text(
                'Registration',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E116B),
                ),
              ),
              const SizedBox(height: 8),

              // Subtext
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Please enter your details to sign up and create an account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF77779D),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Form container (expanded towards the bottom)
              Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: const Color(0xFFEAE9FF)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Form fields
                    _buildTextField(
                        label: 'Country name',
                        hintText: 'your country name here',
                        icon: Icons.language),
                    const SizedBox(height: 20),
                    _buildTextField(
                        label: 'State',
                        hintText: 'your state here',
                        icon: Icons.map),
                    const SizedBox(height: 20),
                    _buildTextField(
                        label: 'City',
                        hintText: 'your city here',
                        icon: Icons.location_city),
                    const SizedBox(height: 20),
                    _buildTextField(
                        label: 'Address',
                        hintText: 'your address here',
                        icon: Icons.location_on_outlined),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              const SizedBox(
                  height: 20), // Extra space between container and button
              // "Next" button aligned at the bottom and full width
              SizedBox(
                width: 320, // Makes the button take full width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/userprofile');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF583EF2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      required String hintText,
      required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F1F39),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(icon, color: const Color(0xFFB8B8D2)),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle: const TextStyle(color: Color(0xFFB8B8D2)),
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
