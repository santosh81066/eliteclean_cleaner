import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../model/bookings_data.dart';
import 'package:intl/intl.dart';

class PendingBookings extends StatefulWidget {
  const PendingBookings({super.key});

  @override
  State<PendingBookings> createState() => _PendingBookingsState();
}

class _PendingBookingsState extends State<PendingBookings> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  List<Booking> _bookings = [];
  bool _isLoading = true;
  int _selectedIndex = 0;
  User? user = FirebaseAuth.instance.currentUser;

  String? selectedValue;
  List<String> cleanerIds = []; // List to hold user IDs of cleaners
  Map<int, String?> selectedValuesMap = {};

  @override
  void initState() {
    super.initState();
    _fetchBookings();
    _fetchCleaners();
  }

  Future<void> _fetchBookings() async {
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

  Future<void> _fetchCleaners() async {
    try {
      final snapshot = await _dbRef.get();
      if (snapshot.exists) {
        final data = snapshot.value as Map<dynamic, dynamic>;
        final List<String> ids = [];

        data.forEach((userId, userData) {
          final userInfo = userData['user_info'] as Map<dynamic, dynamic>?;
          if (userInfo != null) {
            bool hasCleanerRole = userInfo.values.any((value) {
              final userEntry = value as Map<dynamic, dynamic>;
              return userEntry['use_role'] == 'c';
            });

            if (hasCleanerRole) {
              ids.add(userId);
            }
          }
        });

        setState(() {
          cleanerIds = ids;
        });

        print("Cleaner IDs: $cleanerIds");
      } else {
        print("No data found in the root.");
      }
    } catch (e) {
      print("Error fetching cleaners: $e");
    }
  }

  Future<void> assignBookingToCleaner(
      String bookingKey, Map<String, dynamic> bookingDetails) async {
    if (selectedValue == null) {
      print("No cleaner selected");
      return;
    }

    try {
      await _dbRef
          .child('$selectedValue/bookings/$bookingKey')
          .set(bookingDetails);
      print("Booking assigned to cleaner $selectedValue");
    } catch (e) {
      print("Error assigning booking: $e");
    }
  }

  bool _isBookingExpired(String bookingTime) {
    final currentTime = DateTime.now();
    final dateFormat = DateFormat(
        "MMM d, yyyy - h:mm a"); // Match format "Nov 1, 2024 - 6:12 AM"
    final bookingDateTime = dateFormat.parse(bookingTime);

    // Check if the current time is within one hour of the booking time
    final oneHourBeforeBooking = bookingDateTime.subtract(Duration(hours: 1));
    return currentTime.isAfter(oneHourBeforeBooking);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Bookings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 0),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _bookings.isEmpty
                    ? const Image(
                        image: AssetImage('assets/images/nobookingpic.png'))
                    : SizedBox(
                        height: screenHeight,
                        child: ListView.builder(
                          itemCount: _bookings.length,
                          itemBuilder: (context, index) {
                            final booking = _bookings[index];
                            final isExpired = _isBookingExpired(booking.time);
                            return Card(
                              margin: const EdgeInsets.only(bottom: 25),
                              elevation: 0.25,
                              color: const Color(0xfff5f5f5),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(2),
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  ),
                                  side: BorderSide(
                                      color: Color(0x26000000), width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 20),
                                child: ListTile(
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Address : ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${booking.address}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                      const Text(
                                        'Status: ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${booking.bookingStatus}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                      const Text(
                                        'Price: ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${booking.price}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                      const Text(
                                        'Time: ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${booking.time}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Assign a cleaner',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          DropdownButton<String>(
                                            value: selectedValuesMap[index],
                                            hint: Text(
                                                _isBookingExpired(booking.time)
                                                    ? 'Expired'
                                                    : 'Select'),
                                            items: cleanerIds.map((String id) {
                                              return DropdownMenuItem<String>(
                                                value: id,
                                                child: Text(id),
                                              );
                                            }).toList(),
                                            onChanged: _isBookingExpired(
                                                    booking.time)
                                                ? null // Disable dropdown if booking is expired
                                                : (String? newValue) {
                                                    setState(() {
                                                      selectedValuesMap[index] =
                                                          newValue;
                                                    });
                                                  },
                                          ),
                                          ElevatedButton(
                                            onPressed: isExpired
                                                ? null
                                                : () {
                                                    if (selectedValuesMap[
                                                            index] !=
                                                        null) {
                                                      final bookingDetails = {
                                                        'address':
                                                            booking.address,
                                                        'bookingStatus': booking
                                                            .bookingStatus,
                                                        'price': booking.price,
                                                        'time': booking.time,
                                                      };

                                                      assignBookingToCleaner(
                                                          booking.id,
                                                          bookingDetails);
                                                    } else {
                                                      print(
                                                          "Please select a cleaner");
                                                    }
                                                  },
                                            child: const Text('Assign'),
                                          ),
                                        ],
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
    );
  }
}
