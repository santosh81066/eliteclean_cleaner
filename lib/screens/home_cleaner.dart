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
  bool _isLoading = true;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchBookings();
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
                    user_role == 'c'
                        ? TopSectionCleaner(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight)
                        : TopSection(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),

                    // Main content section (Your Packages and Services)
                    Expanded(
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
                                ? Center(child: CircularProgressIndicator())
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
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(2),
                                                    topRight:
                                                        Radius.circular(25),
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(25),
                                                  ),
                                                  side: BorderSide(
                                                      color: Color(0x26000000),
                                                      width: 1)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${booking.address}',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: screenHeight *
                                                              0.01),
                                                      Text(
                                                        'Status: ',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${booking.bookingStatus}',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: screenHeight *
                                                              0.01),
                                                      // Text(
                                                      //     'Creator ID: ${booking.creatorId}'),
                                                      Text(
                                                        'Price: ',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${booking.price}',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: screenHeight *
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
                                                              FontWeight.bold,
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

                        //     Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     const SizedBox(height: 10),
                        //     const Text(
                        //       "Today's work",
                        //       style: TextStyle(
                        //         color: Color(0xFF1E116B),
                        //         fontSize: 20,
                        //         fontFamily: 'Poppins',
                        //         fontWeight: FontWeight.w600,
                        //       ),
                        //     ),
                        //     _isLoading
                        //         ? Center(child: CircularProgressIndicator())
                        //         : _bookings.isEmpty
                        //             ? Image(
                        //                 image: AssetImage(
                        //                     'assets/images/nobookingpic.png'))
                        //             : SizedBox(
                        //                 height:
                        //                     400, // Specify a fixed height or use `Expanded`
                        //                 child: ListView.builder(
                        //                   itemCount: _bookings.length,
                        //                   itemBuilder: (context, index) {
                        //                     final booking = _bookings[index];
                        //                     return Card(
                        //                       elevation: 0.25,
                        //                       color: Color(0xfff5f5f5),
                        //                       shape: RoundedRectangleBorder(
                        //                           borderRadius:
                        //                               BorderRadius.only(
                        //                             topLeft: Radius.circular(2),
                        //                             topRight:
                        //                                 Radius.circular(25),
                        //                             bottomLeft:
                        //                                 Radius.circular(25),
                        //                             bottomRight:
                        //                                 Radius.circular(25),
                        //                           ),
                        //                           side: BorderSide(
                        //                               color: Color(0x26000000),
                        //                               width: 1)),
                        //                       child: Padding(
                        //                         padding:
                        //                             const EdgeInsets.symmetric(
                        //                                 vertical: 16,
                        //                                 horizontal: 20),
                        //                         child: ListTile(
                        //                           // title: Text(booking.package),
                        //                           subtitle: Column(
                        //                             crossAxisAlignment:
                        //                                 CrossAxisAlignment
                        //                                     .start,
                        //                             children: [
                        //                               Text(
                        //                                 'Address : ',
                        //                                 style: TextStyle(
                        //                                   fontSize: 16,
                        //                                   fontWeight:
                        //                                       FontWeight.bold,
                        //                                 ),
                        //                               ),
                        //                               Text(
                        //                                 '${booking.address}',
                        //                                 style: TextStyle(
                        //                                   fontSize: 16,
                        //                                 ),
                        //                               ),
                        //                               SizedBox(
                        //                                   height: screenHeight *
                        //                                       0.01),
                        //                               Text(
                        //                                 'Status: ',
                        //                                 style: TextStyle(
                        //                                   fontSize: 16,
                        //                                   fontWeight:
                        //                                       FontWeight.bold,
                        //                                 ),
                        //                               ),
                        //                               Text(
                        //                                 '${booking.bookingStatus}',
                        //                                 style: TextStyle(
                        //                                   fontSize: 16,
                        //                                 ),
                        //                               ),
                        //                               SizedBox(
                        //                                   height: screenHeight *
                        //                                       0.01),
                        //                               // Text(
                        //                               //     'Creator ID: ${booking.creatorId}'),
                        //                               Text(
                        //                                 'Price: ',
                        //                                 style: TextStyle(
                        //                                   fontSize: 16,
                        //                                   fontWeight:
                        //                                       FontWeight.bold,
                        //                                 ),
                        //                               ),
                        //                               Text(
                        //                                 '${booking.price}',
                        //                                 style: TextStyle(
                        //                                   fontSize: 16,
                        //                                 ),
                        //                               ),
                        //                               SizedBox(
                        //                                   height: screenHeight *
                        //                                       0.01),
                        //                               // Text(
                        //                               //     'Latitude: ${booking.latitude}'),
                        //                               // Text(
                        //                               //     'Longitude: ${booking.longitude}'),
                        //                               Text(
                        //                                 'Time: ',
                        //                                 style: TextStyle(
                        //                                   fontSize: 16,
                        //                                   fontWeight:
                        //                                       FontWeight.bold,
                        //                                 ),
                        //                               ),
                        //                               Text(
                        //                                 '${booking.time}',
                        //                                 style: TextStyle(
                        //                                   fontSize: 16,
                        //                                 ),
                        //                               ),
                        //                             ],
                        //                           ),
                        //                         ),
                        //                       ),
                        //                     );
                        //                   },
                        //                 ),
                        //               ),
                        //     const SizedBox(height: 30),
                        //   ],
                        // ),
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

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Header for the drawer with profile information
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0x4d000000),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          ),
                        ),
                        child: Icon(
                          Icons.image,
                          color: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Janet Anderson",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              "123 points",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // List of drawer items
                _buildDrawerItem(
                  icon: Icons.person_outline,
                  text: 'Profile',
                  onTap: () {},
                ),
                Divider(
                  color: Color(0x0d000000),
                ),
                _buildDrawerItem(
                  icon: Icons.card_giftcard_outlined,
                  text: 'Promotion',
                  onTap: () {},
                ),
                Divider(
                  color: Color(0x0d000000),
                ),
                _buildDrawerItem(
                  icon: Icons.settings_outlined,
                  text: 'Setting',
                  onTap: () {},
                ),
                Divider(
                  color: Color(0x0d000000),
                ),
                _buildDrawerItem(
                  icon: Icons.support_agent_outlined,
                  text: 'Support',
                  onTap: () {},
                ),
                Divider(
                  color: Color(0x0d000000),
                ),
                _buildDrawerItem(
                  icon: Icons.policy_outlined,
                  text: 'Policy',
                  onTap: () {},
                ),
                Divider(
                  color: Color(0x0d000000),
                ),
                _buildDrawerItem(
                  icon: Icons.logout_outlined,
                  text: 'Log out',
                  onTap: () {
                    ref.read(authProvider.notifier).logout();
                  },
                ),
                Divider(
                  color: Color(0x0d000000),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper function to create a drawer item
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    GestureTapCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: Color(0xFF6D6BE7),
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
