import 'package:eliteclean_cleaner/screens/cleaner_registration.dart';
import 'package:eliteclean_cleaner/screens/home.dart';
import 'package:eliteclean_cleaner/screens/loginpage.dart';

import 'package:eliteclean_cleaner/screens/otpverify.dart';
import 'package:eliteclean_cleaner/screens/payment_info.dart';
import 'package:eliteclean_cleaner/screens/slashscreen.dart';
import 'package:eliteclean_cleaner/screens/userprofile.dart';
import 'package:flutter/material.dart';
// Import your LoginPage widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EliteClean',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Define the initial route and the routes in the app
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const Splashscreen(), // Splashscreen as the initial screen
        '/login': (context) => const Login(),
        '/verify': (context) => const Verify(),
        '/register': (context) => const CleanerRegistration(),
        '/userprofile': (context) => const UserProfile(),
        '/paymentinfo': (context) => const PaymentInfo(),
        '/home': (context) => const Home(),
      },
    );
  }
}
