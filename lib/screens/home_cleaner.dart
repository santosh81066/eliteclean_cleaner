import 'package:eliteclean_cleaner/providers/auth.dart';
import 'package:eliteclean_cleaner/widgets/topSectionSupervisor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/topSectionCleaner.dart';
import 'bookings.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
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
                            const SizedBox(height: 100),
                            Container(
                              width: screenWidth * 0.80,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(2),
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'Work for today will appear here',
                                    style: TextStyle(
                                      color: Color(0xFF808080),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Image.asset(
                                    'assets/images/emptyservice.png', // Replace with your image asset path
                                    height: 80,
                                    width: 80,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'No work for today yet...',
                                    style: TextStyle(
                                      color: Color(0xFF808080),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
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
