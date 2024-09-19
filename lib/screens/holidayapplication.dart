import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApplyHoliday extends StatefulWidget {
  const ApplyHoliday({
    super.key,
  });

  @override
  _ApplyHolidayState createState() => _ApplyHolidayState();
}

class _ApplyHolidayState extends State<ApplyHoliday> {
  DateTime? _fromDate;
  DateTime? _toDate;
  String? selectedDays = '1'; // Dropdown default value

  // Function to handle date picking
  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final DateFormat formatter = DateFormat('d/MM/yyyy');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Holiday Application',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff1F126B),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                "You can apply for holidays to your supervisor \nfrom here.",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff818181),
                ),
              ),
              const SizedBox(height: 40),
              //Number of holidays section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Number of days',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1F126B),
                    ),
                  ),
                  const Text(
                    "Please enter the number of days you want for\nholidays.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff818181),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Adding the Dropdown here
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0x80eaeaff),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      value: selectedDays,
                      underline: Container(), // Removes the underline
                      icon: const Icon(Icons.arrow_drop_down),
                      items:
                          <String>['1', '2', '3', '4', '5'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedDays = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              // Date selection section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1F126B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('From'),
                      GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0x80eaeaff),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _fromDate != null
                                ? formatter.format(_fromDate!)
                                : 'Select Date',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                      const Text('To'),
                      GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0x80eaeaff),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _toDate != null
                                ? formatter.format(_toDate!)
                                : 'Select Date',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60),
              //Reason section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reason',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1F126B),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: screenWidth * 0.90,
                    height: screenHeight * 0.22,
                    color: const Color(0x80eaeaff),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText:
                            'Please enter a valid reason for the holidays here...',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 20.0), // Padding inside the text field
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12.0), // Rounded corners
                          borderSide: BorderSide.none, // No visible border
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF583EF2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
