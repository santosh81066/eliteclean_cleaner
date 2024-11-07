import 'package:eliteclean_cleaner/providers/auth.dart';
import 'package:eliteclean_cleaner/widgets/topSectionSupervisor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../model/bookings_data.dart';
import '../widgets/topSectionCleaner.dart';
import 'bookings.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  List<Booking> _bookings = [];
  List<Booking> _cleanerBookings = [];
  bool _isLoading = true;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchBookings();
    _fetchCleanerBookings();
  }

  Future<void> _fetchBookings() async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      final snapshot = await _dbRef.child('${user!.uid}/bookings').get();
      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        setState(() {
          _bookings = data.entries.map((entry) {
            final value = entry.value as Map<dynamic, dynamic>;
            return Booking.fromMap(entry.key, value);
          }).toList();
          _isLoading = false;
        });
      } else {
        print("No bookings found in Firebase.");
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching bookings: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchCleanerBookings() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("No authenticated user found.");
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      // Fetch user info to check for 'use_role' attribute
      final userInfoSnapshot =
          await _dbRef.child('${user.uid}/user_info').get();

      if (userInfoSnapshot.exists) {
        final userInfoMap = userInfoSnapshot.value as Map<dynamic, dynamic>;
        bool isCleaner = false;

        // Iterate over each entry in user_info to find 'use_role' = 'c'
        for (var entry in userInfoMap.entries) {
          final userInfo = entry.value as Map<dynamic, dynamic>;
          if (userInfo['use_role'] == 'c') {
            isCleaner = true;
            break;
          }
        }

        if (isCleaner) {
          // User role is 'c', fetch bookings
          final bookingsSnapshot =
              await _dbRef.child('${user.uid}/bookings').get();

          if (bookingsSnapshot.exists) {
            final data = bookingsSnapshot.value as Map<dynamic, dynamic>;
            setState(() {
              _cleanerBookings = data.entries.map((entry) {
                final value = entry.value as Map<dynamic, dynamic>;
                return Booking.fromMap(entry.key, value);
              }).toList();
              _isLoading = false;
            });
          } else {
            print("No bookings found in Firebase.");
            setState(() {
              _isLoading = false;
            });
          }
        } else {
          print("User does not have the 'use_role' = 'c'");
          setState(() {
            _isLoading = false;
          });
        }
      } else {
        print("No user info found.");
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching bookings: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Handle navigation logic here for each index if required
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final today = DateTime.now();
    final todayDateString = DateFormat('yyyy-MM-dd').format(today);

    // Filter bookings with today's date in the `time` field
    final todayBookings = _bookings.where((booking) {
      final bookingDate = DateTime.tryParse(booking.time);
      return bookingDate != null &&
          DateFormat('yyyy-MM-dd').format(bookingDate) == todayDateString;
    }).toList();

    final List<Widget> pages = [
      // Home Page
      const Home(),

      BookingScreen(),
      // Settings Page
      const Center(
        child: Text(
          'Settings Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Notifications Page
      const Center(
        child: Text(
          'Notifications Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ];

    return Consumer(
      builder: (context, ref, child) {
        var user_role = ref.read(authProvider).data?.useRole;
        return Scaffold(
          backgroundColor: Colors.white,
          body: _selectedIndex == 0
              ? Column(
                  children: [
                    user_role == 's'
                        ? TopSection(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight)
                        : TopSectionCleaner(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                    // Main content section (Your Packages and Services)
                    user_role == 's'
                        ? Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Today's work",
                                    style: TextStyle(
                                      color: Color(0xFF1E116B),
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  _isLoading
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : todayBookings.isEmpty
                                          ? Image(
                                              image: AssetImage(
                                                  'assets/images/nobookingpic.png'))
                                          : SizedBox(
                                              height: 400,
                                              child: ListView.builder(
                                                itemCount: todayBookings.length,
                                                itemBuilder: (context, index) {
                                                  final booking =
                                                      todayBookings[index];
                                                  return Card(
                                                    elevation: 0.25,
                                                    color: Color(0xfff5f5f5),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(2),
                                                              topRight: Radius
                                                                  .circular(25),
                                                              bottomLeft: Radius
                                                                  .circular(25),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0x26000000),
                                                                width: 1)),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 16,
                                                          horizontal: 20),
                                                      child: ListTile(
                                                        // title: Text(booking.package),
                                                        subtitle: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Address : ',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${booking.address}',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    screenHeight *
                                                                        0.01),
                                                            Text(
                                                              'Status: ',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${booking.bookingStatus}',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    screenHeight *
                                                                        0.01),
                                                            // Text(
                                                            //     'Creator ID: ${booking.creatorId}'),
                                                            Text(
                                                              'Price: ',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${booking.price}',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    screenHeight *
                                                                        0.01),
                                                            // Text(
                                                            //     'Latitude: ${booking.latitude}'),
                                                            // Text(
                                                            //     'Longitude: ${booking.longitude}'),
                                                            Text(
                                                              'Time: ',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${booking.time}',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  const Text(
                                    "work",
                                    style: TextStyle(
                                      color: Color(0xFF1E116B),
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  _isLoading
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : todayBookings.isEmpty
                                          ? Image(
                                              image: AssetImage(
                                                  'assets/images/nobookingpic.png'))
                                          : SizedBox(
                                              height: 400,
                                              child: ListView.builder(
                                                itemCount:
                                                    _cleanerBookings.length,
                                                itemBuilder: (context, index) {
                                                  final cleanerbooking =
                                                      _cleanerBookings[index];
                                                  return Card(
                                                    elevation: 0.25,
                                                    color: Color(0xfff5f5f5),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(2),
                                                              topRight: Radius
                                                                  .circular(25),
                                                              bottomLeft: Radius
                                                                  .circular(25),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0x26000000),
                                                                width: 1)),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 16,
                                                          horizontal: 20),
                                                      child: ListTile(
                                                        // title: Text(booking.package),
                                                        subtitle: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Address : ',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${cleanerbooking.address}',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    screenHeight *
                                                                        0.01),
                                                            Text(
                                                              'Status: ',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${cleanerbooking.bookingStatus}',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    screenHeight *
                                                                        0.01),
                                                            // Text(
                                                            //     'Creator ID: ${booking.creatorId}'),
                                                            Text(
                                                              'Price: ',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${cleanerbooking.price}',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    screenHeight *
                                                                        0.01),
                                                            // Text(
                                                            //     'Latitude: ${booking.latitude}'),
                                                            // Text(
                                                            //     'Longitude: ${booking.longitude}'),
                                                            Text(
                                                              'Time: ',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${cleanerbooking.time}',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ),
                  ],
                )
              : pages.elementAt(_selectedIndex),

          // Bottom Navigation Bar
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            elevation: 15,
            selectedItemColor: const Color(0xFF583EF2),
            unselectedItemColor: const Color(0xFF77779D),
            currentIndex: _selectedIndex, // Set the currently selected index
            onTap: _onItemTapped, // Update selected index when a tab is tapped
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notification',
              ),
            ],
          ),
        );
      },
    );
  }
}
