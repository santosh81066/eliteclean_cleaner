import 'package:eliteclean_cleaner/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  height: screenHeight * 0.1), // Space from top to the logo

              // Logo at the top
              SvgPicture.asset(
                'assets/images/logo-icon.svg', // Path to your SVG file
                fit: BoxFit.contain, // Adjust fit as needed
              ),

              const SizedBox(height: 16),

              // "Sign up" text
              const Text(
                'Sign up',
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
                height: screenHeight * 0.60, // Adjust height of the container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: const Color(0xFFEAE9FF)),
                ),
                child: Column(
                  // Align the button at the bottom
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Form fields
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // "Your name" label and input field
                        Text(
                          'Your name',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F1F39),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.person, color: Color(0xFFB8B8D2)),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: 'your name here',
                                  border: InputBorder.none,
                                  hintStyle:
                                      TextStyle(color: Color(0xFFB8B8D2)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone number',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F1F39),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.phone_outlined,
                                color: Color(0xFFB8B8D2)),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: 'your phone number here',
                                  border: InputBorder.none,
                                  hintStyle:
                                      TextStyle(color: Color(0xFFB8B8D2)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Consumer(
                      builder: (con, ref, wid) {
                        var navigate = ref.watch(navigationProvider.notifier);
                        return Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: ref.watch(navigationProvider),
                              onChanged: (int? value) {
                                navigate.navigate(0);
                              },
                            ),
                            const Text('Cleaner'),
                            Radio(
                              value: 1,
                              groupValue: ref.watch(navigationProvider),
                              onChanged: (int? value) {
                                navigate.navigate(1);
                              },
                            ),
                            const Text('Supervisor'),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    // "Next" button aligned at the bottom and full width
                    SizedBox(
                      width:
                          double.infinity, // Makes the button take full width
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/verify');
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
