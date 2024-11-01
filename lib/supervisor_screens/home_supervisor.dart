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
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final List<Widget> pages = [
      const HomeSupervisor(),
      const Center(
        child: Text(
          'Bookings',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Center(
        child: Text(
          'Settings  Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
                const SizedBox(height: 25),

                // Main content section (Today's Work)
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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

                          // First set of Today's work cards
                          ...List.generate(2, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Card(
                                elevation: 0,
                                color: const Color(0xffF5F5F5),
                                margin: const EdgeInsets.all(8),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(2),
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  ),
                                  side: BorderSide(
                                    color: Color(0xffEAEAFF),
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 4),
                                            Container(
                                              width: screenWidth * 0.6,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Ali Raza",
                                                    style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  PopupMenuButton<String>(
                                                    offset:
                                                        const Offset(-15, 30),
                                                    color: Colors.white,
                                                    icon: const Icon(
                                                        Icons.more_horiz,
                                                        color: Colors.black),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(8),
                                                        topLeft:
                                                            Radius.circular(8),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                      ),
                                                    ),
                                                    onSelected:
                                                        (String result) {
                                                      // Add logic for menu options here
                                                    },
                                                    itemBuilder: (BuildContext
                                                            context) =>
                                                        <PopupMenuEntry<
                                                            String>>[
                                                      const PopupMenuItem<
                                                          String>(
                                                        value: 'View Status',
                                                        child:
                                                            Text('View Status'),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on_outlined,
                                                  color: Color(0xffF3A8A2),
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "Room ${index + 100}, Street ${index + 1},\n District ${index + 1}",
                                                  style: const TextStyle(
                                                    color: Color(0xff6E6BE8),
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              "1 House",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "3 Washrooms",
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              "Timing",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "06:30 AM",
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              "Cleaner Name",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Container(
                                              width: screenWidth * 0.55,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Cleaner ${index + 1}",
                                                    style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 8,
                                                        horizontal: 20),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xffFFB457),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(15),
                                                        topLeft:
                                                            Radius.circular(2),
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                          }),

                          // Add second "Today's work" section
                          const SizedBox(height: 25),
                          const Text(
                            "New booking Requests",
                            style: TextStyle(
                              color: Color(0xFF1E116B),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Second set of Today's work cards
                          ...List.generate(2, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Card(
                                elevation: 0,
                                color: const Color(0xffF5F5F5),
                                margin: const EdgeInsets.all(8),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(2),
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  ),
                                  side: const BorderSide(
                                    color: Color(0xffEAEAFF),
                                    width: 1.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 4),
                                            Container(
                                              width: screenWidth * 0.6,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Usman Khan",
                                                    style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  PopupMenuButton<String>(
                                                    offset:
                                                        const Offset(-15, 30),
                                                    color: Colors.white,
                                                    icon: const Icon(
                                                        Icons.more_horiz,
                                                        color: Colors.black),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(8),
                                                        topLeft:
                                                            Radius.circular(8),
                                                        bottomRight:
                                                            Radius.circular(8),
                                                      ),
                                                    ),
                                                    onSelected:
                                                        (String result) {
                                                      // Add logic for menu options here
                                                    },
                                                    itemBuilder: (BuildContext
                                                            context) =>
                                                        <PopupMenuEntry<
                                                            String>>[
                                                      const PopupMenuItem<
                                                          String>(
                                                        value: 'View Status',
                                                        child:
                                                            Text('View Status'),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on_outlined,
                                                  color: Color(0xffF3A8A2),
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "Room ${index + 200}, Street ${index + 3},\n District ${index + 3}",
                                                  style: const TextStyle(
                                                    color: Color(0xff6E6BE8),
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              "2 Houses",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "5 Washrooms",
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              "Timing",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "07:00 AM",
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              "Cleaner Name",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Container(
                                              width: screenWidth * 0.55,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Cleaner ${index + 3}",
                                                    style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 8,
                                                        horizontal: 20),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xffFFB457),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(15),
                                                        topLeft:
                                                            Radius.circular(2),
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                          }),

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
                        ],
                      ),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
