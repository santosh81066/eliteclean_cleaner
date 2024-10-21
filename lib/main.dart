import 'package:eliteclean_cleaner/screens/cleaner_registration.dart';
import 'package:eliteclean_cleaner/screens/holidayapplication.dart';
import 'package:eliteclean_cleaner/screens/home_cleaner.dart';
import 'package:eliteclean_cleaner/screens/loginpage.dart';
import 'package:eliteclean_cleaner/screens/otpverify.dart';
import 'package:eliteclean_cleaner/screens/payment_info.dart';
import 'package:eliteclean_cleaner/screens/slashscreen.dart';
import 'package:eliteclean_cleaner/screens/userprofile.dart';
import 'package:eliteclean_cleaner/supervisor_screens/allcleaners_supervisor.dart';
import 'package:eliteclean_cleaner/supervisor_screens/holiday_applications.dart';
import 'package:eliteclean_cleaner/supervisor_screens/home_supervisor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'providers/auth.dart';

// Import your LoginPage widget
void main() async {
  // Ensure that widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: const MyApp()));
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
        '/': (context) {
          return Consumer(
            builder: (context, ref, child) {
              final authState = ref.watch(authProvider);

              // Check if the user has a valid refresh token
              if (authState.data?.refreshToken != null &&
                  authState.data!.refreshToken!.isNotEmpty) {
                print('Refresh token exists: ${authState.data?.refreshToken}');
                return Home(); // User is authenticated, redirect to Home
              } else {
                print('No valid refresh token, trying auto-login');
              }

              // Attempt auto-login if refresh token is not in state
              return FutureBuilder(
                future: ref.watch(authProvider.notifier).tryAutoLogin(),
                builder: (context, snapshot) {
                  print(
                      'Token after auto-login attempt: ${authState.data?.accessToken}');
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    ); // Show SplashScreen while waiting
                  } else if (snapshot.hasData &&
                      snapshot.data == true &&
                      authState.data?.refreshToken != null) {
                    // If auto-login is successful and refresh token is available, go to Home
                    return Home();
                  } else {
                    // If auto-login fails, redirect to login page
                    return Login();
                  }
                },
              );
            },
          );
        }, // Splashscreen as the initial screen
        '/login': (context) => const Login(),
        '/verify': (context) => const Verify(),
        '/register': (context) => const CleanerRegistration(),
        '/userprofile': (context) => const UserProfile(),
        '/paymentinfo': (context) => const PaymentInfo(),
        '/home': (context) => const Home(),
        '/homesupervisor': (context) => const HomeSupervisor(),
        '/applyholiday': (context) => const ApplyHoliday(),
        '/allcleaners': (context) => AllCleaners(),
        '/holidayapps': (context) => HolidayApps(),
      },
    );
  }
}
