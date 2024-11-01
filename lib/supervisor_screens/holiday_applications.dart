import 'package:flutter/material.dart';

class HolidayApps extends StatelessWidget {
  HolidayApps({super.key});
  final List<Map<String, String>> bookings = [
    {
      "bookingNo": "#12KL23",
      "date": "ksjhfuwfhfjdfhjdfhjhfj...",
      "time": "From 25/02/22 To 28/02/22",
      "location": "Room 123, Brooklyn St,\n Kepler District",
      "name": "Ali Raza",
      "service": "3"
    },
    {
      "bookingNo": "#12KL23",
      "date": "ksjhfuwfhfjdfhjdfhjhfj...",
      "time": "From 25/02/22 To 28/02/22",
      "location": "Room 123, Brooklyn St,\n Kepler District",
      "name": "Ali Raza",
      "service": "3"
    },
    {
      "bookingNo": "#12KL23",
      "date": "ksjhfuwfhfjdfhjdfhjhfj...",
      "time": "From 25/02/22 To 28/02/22",
      "location": "Room 123, Brooklyn St,\n Kepler District",
      "name": "Ali Raza",
      "service": "3"
    },
    // Add more bookings if needed
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Ensure AppBar background is also white
        iconTheme:
            const IconThemeData(color: Colors.black), // AppBar icon color
        title: const Text(
          'Holiday Applications',
          style: TextStyle(
              color: Color(0xff1F126B),
              fontSize: 20,
              fontWeight: FontWeight.bold), // AppBar title color
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
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
                            topLeft: Radius.circular(screenWidth * 0.01),
                            topRight: Radius.circular(screenWidth * 0.16),
                            bottomLeft: Radius.circular(screenWidth * 0.16),
                            bottomRight: Radius.circular(screenWidth * 0.16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Container(
                              width: screenWidth * 0.6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    bookings[index]["name"]!,
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  PopupMenuButton<String>(
                                    offset: const Offset(0, 30),
                                    color: Colors.white,
                                    icon: const Icon(Icons.more_horiz,
                                        color: Colors.black),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    onSelected: (String result) {
                                      switch (result) {
                                        case 'Accept':
                                          Navigator.of(context)
                                              .pushNamed('/pendingbooking');
                                          break;
                                        case 'Reject':
                                          Navigator.of(context)
                                              .pushNamed('/pendingbooking');
                                          break;
                                      }
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<String>>[
                                      const PopupMenuItem<String>(
                                        value: 'Accept',
                                        child: Text('Accept'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'Reject',
                                        child: Text('Reject'),
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
                                  bookings[index]["location"]!,
                                  style: TextStyle(
                                    color: Color(0xff6E6BE8),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "No. of days",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              bookings[index]["service"]!,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Dates",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              bookings[index]["time"]!,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Reason",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Container(
                              width: screenWidth * 0.58,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ksjhfuwfhfjdfhjdfhjhfj...',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Text(
                                    "See full",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xFFFFB457),
                                      color: Color(0xFFFFB457),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
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
          },
        ),
      ),
    );
  }
}
