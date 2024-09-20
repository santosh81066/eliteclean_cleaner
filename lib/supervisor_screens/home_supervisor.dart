import 'package:flutter/material.dart';

import '../widgets/topSectionSupervisor.dart';

class HomeSupervisor extends StatefulWidget {
  const HomeSupervisor({super.key});
  @override
  State<HomeSupervisor> createState() => _HomeSupervisorState();
}

class _HomeSupervisorState extends State<HomeSupervisor> {
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
      const HomeSupervisor(),
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: _selectedIndex == 0
          ? Column(
              children: [
                TopSection(
                    screenWidth: screenWidth, screenHeight: screenHeight),

                // Main content section (Your Packages and Services)
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        const Text(
                          "Today's work",
                          style: TextStyle(
                            color: Color(0xFF1E116B),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Card(
                          elevation: 0,
                          color: Color(0xffF5F5F5),
                          margin: const EdgeInsets.all(8),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            side: BorderSide(
                              color: Color(0xffEAEAFF), // Border color
                              width: 1.5, // Border width
                            ),
                          ),
                          clipBehavior:
                              Clip.hardEdge, // Optional: to clip overflow
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 250, // Set minimum width
                              maxWidth: 350, // Set maximum width
                              minHeight: 100, // Set minimum height
                              maxHeight: 250, // Set maximum height
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth * 0.15,
                                      height: screenWidth * 0.15,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        border: Border.all(
                                          style: BorderStyle.solid,
                                          color: const Color(0xffEAEAFF),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              screenWidth * 0.01),
                                          topRight: Radius.circular(
                                              screenWidth * 0.16),
                                          bottomLeft: Radius.circular(
                                              screenWidth * 0.16),
                                          bottomRight: Radius.circular(
                                              screenWidth * 0.16),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 4),
                                          Text(
                                            "Ali Raza",
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                color: Color(0xffF3A8A2),
                                              ),
                                              Text(
                                                "Room 123, Brooklyn St,\n Kepler District",
                                                style: TextStyle(
                                                  color: Color(0xff6E6BE8),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text(
                                            "1 House",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "3 washrooms",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            "Time",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "12:30 PM",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Text(
                                                "Date",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '22 Mar 2021',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 18,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 20),
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffFFB457),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    topLeft: Radius.circular(2),
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Daily',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          color: Color(0xffF5F5F5),
                          margin: const EdgeInsets.all(8),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            side: BorderSide(
                              color: Color(0xffEAEAFF), // Border color
                              width: 1.5, // Border width
                            ),
                          ),
                          clipBehavior:
                              Clip.hardEdge, // Optional: to clip overflow
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 250, // Set minimum width
                              maxWidth: 350, // Set maximum width
                              minHeight: 100, // Set minimum height
                              maxHeight: 250, // Set maximum height
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth * 0.15,
                                      height: screenWidth * 0.15,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        border: Border.all(
                                          style: BorderStyle.solid,
                                          color: const Color(0xffEAEAFF),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              screenWidth * 0.01),
                                          topRight: Radius.circular(
                                              screenWidth * 0.16),
                                          bottomLeft: Radius.circular(
                                              screenWidth * 0.16),
                                          bottomRight: Radius.circular(
                                              screenWidth * 0.16),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 4),
                                          Text(
                                            "Ali Raza",
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                color: Color(0xffF3A8A2),
                                              ),
                                              Text(
                                                "Room 123, Brooklyn St,\n Kepler District",
                                                style: TextStyle(
                                                  color: Color(0xff6E6BE8),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text(
                                            "1 House",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "3 washrooms",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            "Time",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "12:30 PM",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Text(
                                                "Date",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '22 Mar 2021',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 18,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 20),
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffFFB457),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    topLeft: Radius.circular(2),
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Daily',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "View all",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF1E116B),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          "Yesterday's work",
                          style: TextStyle(
                            color: Color(0xFF1E116B),
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Card(
                          elevation: 0,
                          color: Color(0xffF5F5F5),
                          margin: const EdgeInsets.all(8),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            side: BorderSide(
                              color: Color(0xffEAEAFF), // Border color
                              width: 1.5, // Border width
                            ),
                          ),
                          clipBehavior:
                              Clip.hardEdge, // Optional: to clip overflow
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 250, // Set minimum width
                              maxWidth: 350, // Set maximum width
                              minHeight: 100, // Set minimum height
                              maxHeight: 250, // Set maximum height
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth * 0.15,
                                      height: screenWidth * 0.15,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        border: Border.all(
                                          style: BorderStyle.solid,
                                          color: const Color(0xffEAEAFF),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              screenWidth * 0.01),
                                          topRight: Radius.circular(
                                              screenWidth * 0.16),
                                          bottomLeft: Radius.circular(
                                              screenWidth * 0.16),
                                          bottomRight: Radius.circular(
                                              screenWidth * 0.16),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Text(
                                                "Ali Raza",
                                                style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              // PopupMenuButton<String>(
                                              //   offset: const Offset(0, 30),
                                              //   color: Colors.white,
                                              //   icon: const Icon(
                                              //       Icons.more_horiz,
                                              //       color: Colors.black),
                                              //   shape:
                                              //       const RoundedRectangleBorder(
                                              //     borderRadius:
                                              //         BorderRadius.only(
                                              //       bottomLeft:
                                              //           Radius.circular(8),
                                              //       bottomRight:
                                              //           Radius.circular(8),
                                              //     ),
                                              //   ),
                                              //   onSelected: (String result) {
                                              //     switch (result) {
                                              //       case 'Accept':
                                              //         Navigator.of(context)
                                              //             .pushNamed(
                                              //                 '/pendingbooking');
                                              //         break;
                                              //       case 'Reject':
                                              //         Navigator.of(context)
                                              //             .pushNamed(
                                              //                 '/pendingbooking');
                                              //         break;
                                              //     }
                                              //   },
                                              //   itemBuilder: (BuildContext
                                              //           context) =>
                                              //       <PopupMenuEntry<String>>[
                                              //     const PopupMenuItem<String>(
                                              //       value: 'Accept',
                                              //       child: Text('Accept'),
                                              //     ),
                                              //     const PopupMenuItem<String>(
                                              //       value: 'Reject',
                                              //       child: Text('Reject'),
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                color: Color(0xffF3A8A2),
                                              ),
                                              Text(
                                                "Room 123, Brooklyn St,\n Kepler District",
                                                style: TextStyle(
                                                  color: Color(0xff6E6BE8),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text(
                                            "1 House",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "3 washrooms",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            "Time",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "12:30 PM",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Text(
                                                "Date",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '22 Mar 2021',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 18,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 20),
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffFFB457),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    topLeft: Radius.circular(2),
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Daily',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          color: Color(0xffF5F5F5),
                          margin: const EdgeInsets.all(8),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            side: BorderSide(
                              color: Color(0xffEAEAFF), // Border color
                              width: 1.5, // Border width
                            ),
                          ),
                          clipBehavior:
                              Clip.hardEdge, // Optional: to clip overflow
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 250, // Set minimum width
                              maxWidth: 350, // Set maximum width
                              minHeight: 100, // Set minimum height
                              maxHeight: 250, // Set maximum height
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth * 0.15,
                                      height: screenWidth * 0.15,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        border: Border.all(
                                          style: BorderStyle.solid,
                                          color: const Color(0xffEAEAFF),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              screenWidth * 0.01),
                                          topRight: Radius.circular(
                                              screenWidth * 0.16),
                                          bottomLeft: Radius.circular(
                                              screenWidth * 0.16),
                                          bottomRight: Radius.circular(
                                              screenWidth * 0.16),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 4),
                                          Text(
                                            "Ali Raza",
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                color: Color(0xffF3A8A2),
                                              ),
                                              Text(
                                                "Room 123, Brooklyn St,\n Kepler District",
                                                style: TextStyle(
                                                  color: Color(0xff6E6BE8),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text(
                                            "1 House",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "3 washrooms",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            "Time",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "12:30 PM",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const Text(
                                                "Date",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                '22 Mar 2021',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 14,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 18,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 20),
                                                decoration: const BoxDecoration(
                                                  color: Color(0xffFFB457),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    topLeft: Radius.circular(2),
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Daily',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "View all",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF1E116B),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 25),
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
  }
}
