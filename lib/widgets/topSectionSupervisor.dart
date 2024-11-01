import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple header section
        Container(
          width: screenWidth,
          height: screenHeight * 0.31,
          decoration: const BoxDecoration(
            color: Color(0xFF6D6BE7),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 50.0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.orange,
                      size: 40,
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My location',
                          style: TextStyle(
                            color: Color(0xFFB0BCE7),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Barcelona, Spain',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 16,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  'Hi Saim,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Need some help today?',
                  style: TextStyle(
                    color: Color(0xFFF8F8FA),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Custom toggle button with stack for opacity control
        Positioned(
          top: screenHeight * 0.08,
          right: screenWidth * 0.05,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PopupMenuButton<String>(
                offset: const Offset(-20, 100),
                color: Colors.white,
                icon: Opacity(
                  opacity: 0.7,
                  child: Container(
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.2,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFEAE9FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x266D6BE7),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          spreadRadius: 1,
                        )
                      ],
                    ),
                  ),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                onSelected: (String result) {
                  switch (result) {
                    case 'Profile':
                      Navigator.of(context).pushNamed('/profile');
                      break;
                    case 'All cleaners':
                      Navigator.of(context).pushNamed('/allcleaners');
                      break;
                    case 'Holiday applications':
                      Navigator.of(context).pushNamed('/holidayapps');
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Profile',
                    child: Text('Profile'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'All cleaners',
                    child: Text('All cleaners'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Holiday applications',
                    child: Text('Holiday applications'),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 30,
                    height: 5,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 30,
                    height: 5,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),

        // Responsive row of containers
        Positioned(
          bottom: screenHeight * 0.01,
          left: screenWidth * 0.04,
          right: screenWidth * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xffEAEAFF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    "5 new booking\nrequests",
                    style: TextStyle(
                      color: Color(0xff38385E),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xffFFEBF0),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    "10 new cleaners",
                    style: TextStyle(
                      color: Color(0xff38385E),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xffECFCFF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    "2 cleaners on\nholiday",
                    style: TextStyle(
                      color: Color(0xff38385E),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
