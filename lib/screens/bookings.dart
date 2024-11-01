import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  final List<Map<String, String>> bookings = [
    {
      "bookingNo": "#12KL23",
      "date": "13 Mar 2021",
      "time": "12:30 PM",
      "location": "Room 123, Brooklyn St,\n Kepler District",
      "name": "Ali Raza",
      "service": "3 washrooms"
    },
    {
      "bookingNo": "#12KL23",
      "date": "13 Mar 2021",
      "time": "12:30 PM",
      "location": "Room 123, Brooklyn St,\n Kepler District",
      "name": "Ali Raza",
      "service": "3 washrooms"
    },
    {
      "bookingNo": "#12KL23",
      "date": "13 Mar 2021",
      "time": "12:30 PM",
      "location": "Room 123, Brooklyn St,\n Kepler District",
      "name": "Ali Raza",
      "service": "3 washrooms"
    },
    // Add more bookings if needed
  ];

  BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth > 390 ? 350 : screenWidth * 0.9;

    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor:
            Colors.white, // Set the background color of the Scaffold body
        appBar: AppBar(
          backgroundColor:
              Colors.white, // Ensure AppBar background is also white
          iconTheme:
              const IconThemeData(color: Colors.black), // AppBar icon color
          title: const Text(
            'Bookings',
            style: TextStyle(color: Colors.black), // AppBar title color
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: containerWidth,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'All',
                            style: TextStyle(
                              color: Color(0xFF1E116B),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          PopupMenuButton<String>(
                            offset: const Offset(0, 30),
                            color: Colors.white,
                            icon: const Icon(Icons.more_horiz,
                                color: Colors.black),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                    8), // Custom radius for bottom left
                                bottomRight: Radius.circular(
                                    8), // Custom radius for bottom right
                              ),
                            ),
                            onSelected: (String result) {
                              switch (result) {
                                case 'Pending Bookings':
                                  Navigator.of(context)
                                      .pushNamed('/pendingbooking');
                                  // Handle edit action
                                  break;
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'Pending Bookings',
                                child: Text('Pending Bookings'),
                              ),
                            ],
                          ), // Three dots icon
                        ],
                      ),
                      const SizedBox(
                          height:
                              10), // Space between the row and the main container
                      Container(
                        width: containerWidth * 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 0,
                              color: Colors.white,
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
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
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
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 4),
                                            Text(
                                              "Ali Raza",
                                              style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons.location_on_outlined),
                                                Text(
                                                  "Room 123, Brooklyn St,\n Kepler District",
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Text("1 House"),
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
                                            const Text("Time"),
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
                                                const Text("Date"),
                                                Text(
                                                  '22 Mar 2021',
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
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
                                            const SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // TabBar is directly below the main container
                      const TabBar(
                        dividerColor: Colors.transparent,
                        indicatorColor: Color(0xFF583EF2),
                        labelColor: Color(0xFF1E116B),
                        unselectedLabelColor: Color(0xFFB8B8D2),
                        tabs: [
                          Tab(text: 'Completed'),
                          Tab(text: 'Cancelled'),
                        ],
                      ),
                      // Expanded inside a SingleChildScrollView to prevent overflow and layout issues
                      SizedBox(
                        height:
                            300, // Specify a fixed height for the tab content area
                        child: TabBarView(
                          children: [
                            ListView.builder(
                              itemCount: bookings.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: Colors.white,
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
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
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 4),
                                                Text(
                                                  bookings[index]["name"]!,
                                                  style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    const Icon(Icons
                                                        .location_on_outlined),
                                                    Text(
                                                      bookings[index]
                                                          ["location"]!,
                                                      style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Text("1 House"),
                                                Text(
                                                  '${bookings[index]["service"]}',
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                const Text("Time"),
                                                Text(
                                                  '${bookings[index]["time"]}',
                                                  style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    const Text("Date"),
                                                    Text(
                                                      '22 Mar 2021',
                                                      style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8,
                                                          horizontal: 20),
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Color(0xffFFB457),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  15),
                                                          topLeft:
                                                              Radius.circular(
                                                                  2),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  15),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15),
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
                                                const SizedBox(height: 8),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            const Center(
                              child: Text('No cancelled bookings'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
