import 'package:flutter/material.dart';
import 'booking2.dart';

class BookingDetailsScreen extends StatefulWidget {
  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  // ข้อมูลการจอง
  List<Map<String, dynamic>> workingDates = [
    {'date': '2025-09-29', 'startTime': '10:00', 'hours': '4'},
    {'date': '2025-09-30', 'startTime': '09:30', 'hours': '6'},
  ];

  // ฟังก์ชันเลือกวันที่
  Future<void> _selectDate(BuildContext context, int index) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFFE8B574),
              onPrimary: Colors.black,
              surface: Color(0xFF2D2D2D),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        workingDates[index]['date'] =
            '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
  }

  // ฟังก์ชันเลือกเวลา
  Future<void> _selectTime(BuildContext context, int index) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFFE8B574),
              onPrimary: Colors.black,
              surface: Color(0xFF2D2D2D),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        workingDates[index]['startTime'] =
            '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
      });
    }
  }

  // ฟังก์ชันเลือกจำนวนชั่วโมง
  void _selectHours(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFF2D2D2D),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Select Working Hours',
                style: TextStyle(
                  color: Color(0xFFE8B574),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit',
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, hourIndex) {
                    final hours = (hourIndex + 1).toString();
                    return ListTile(
                      title: Text(
                        '$hours ${int.parse(hours) == 1 ? "hour" : "hours"}',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Kanit',
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          workingDates[index]['hours'] = hours;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ฟังก์ชันเพิ่มวันใหม่
  void _addNewDay() {
    setState(() {
      workingDates.add({
        'date': DateTime.now().toString().split(' ')[0],
        'startTime': '09:00',
        'hours': '4',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232323),
      appBar: AppBar(
        backgroundColor: Color(0xFF232323),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Booking Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'Kanit',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ข้อมูลผู้จอง
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF2D2D2D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // รูปโปรไฟล์
                  CircleAvatar(
                    backgroundImage: AssetImage('image/pretty2.png'),
                    radius: 32,
                  ),
                  SizedBox(width: 16),
                  // ชื่อและ rating
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alena Brown',
                        style: TextStyle(
                          color: Color(0xFFE8B574),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Color(0xFFE8B574), size: 16),
                          SizedBox(width: 4),
                          Text(
                            '4.2 Rating',
                            style: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Kanit',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // ราคาและรายละเอียด package
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF2D2D2D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'MC 4 hours.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 241, 203, 153),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                      ),
                      Text(
                        'Price : 4,000',
                        style: TextStyle(
                          color: Color(0xFFE8B574),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '4 hours',
                    style: TextStyle(
                      color: Color(0xFFEBDFC5),
                      fontSize: 12,
                      fontFamily: 'Kanit',
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Package Details such as Ideal for large conferences, festivals or corporate events. The transaction time does not exceed 8 hours.',
                    style: TextStyle(
                      color: Color(0xFFEBDFC5),
                      fontSize: 13,
                      fontFamily: 'Kanit',
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // List of working dates - Each in separate box
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: workingDates.length,
              itemBuilder: (context, index) {
                final dateInfo = workingDates[index];
                final isLastItem = index == workingDates.length - 1;

                return Padding(
                  padding: EdgeInsets.only(bottom: isLastItem ? 0 : 12),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF2D2D2D),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Working Date Title with Close button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Working Date',
                              style: TextStyle(
                                color: Color(0xFFE8B574),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit',
                              ),
                            ),
                            // Close button - Only show if more than 1 date
                            if (workingDates.length > 1)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    workingDates.removeAt(index);
                                  });
                                },
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Color(0xFFE8B574),
                                    BlendMode.srcIn,
                                  ),
                                  child: Image.asset(
                                    'image/cancel.png',
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 12),
                        // Headers Row
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Start Date',
                                style: TextStyle(
                                  color: Color(0xFFEBDFC5),
                                  fontSize: 12,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Start Time',
                                style: TextStyle(
                                  color: Color(0xFFEBDFC5),
                                  fontSize: 12,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Working Hours',
                                style: TextStyle(
                                  color: Color(0xFFEBDFC5),
                                  fontSize: 12,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        // Input Fields Row
                        Row(
                          children: [
                            // Start Date Input
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () => _selectDate(context, index),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        dateInfo['date'] ?? '',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Kanit',
                                          fontSize: 13,
                                        ),
                                      ),
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.black54,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            // Start Time Input
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () => _selectTime(context, index),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        dateInfo['startTime'] ?? '',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Kanit',
                                          fontSize: 13,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black54,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            // Working Hours Input
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () => _selectHours(context, index),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        dateInfo['hours'] ?? '',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Kanit',
                                          fontSize: 13,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black54,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Add Day Button - Only show in last box
                        if (isLastItem) ...[
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: _addNewDay,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFE8B574),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '+Add Day',
                                style: TextStyle(
                                  color: Color(0xFF232323),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 24),

            // Continue Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingDetailsPage()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Color(0xFFE8B574),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Color(0xFF232323),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
