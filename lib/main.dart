import 'package:eliteclean_cleaner/screens/cleaner_registration.dart';
import 'package:eliteclean_cleaner/screens/loginpage.dart';

import 'package:eliteclean_cleaner/screens/otpverify.dart';
import 'package:eliteclean_cleaner/screens/slashscreen.dart';
import 'package:flutter/material.dart';
// Import your LoginPage widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (context) => Splashscreen(), // Splashscreen as the initial screen
        '/login': (context) => Login(),
        '/verify': (context) => Verify(),
        '/register': (context) =>
            CleanerRegistration(), // otp route// otp route
      },
    );
  }
}
