 import 'package:flutter/material.dart';
import '../chat/Chat.dart';

class CancelJobPage extends StatelessWidget {
  final String title;
  final String name;
  final String date;
  final String checkIn;
  final String checkOut;
  final String status;
  final Color statusColor;

  const CancelJobPage({
    Key? key,
    required this.title,
    required this.name,
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.status,
    required this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        backgroundColor: Color(0xFF181818),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Job Detail',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kanit',
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // Job ID
              Text(
                'Job ID: 67012500001',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontFamily: 'Kanit',
                ),
              ),
              SizedBox(height: 12),

              // Date and Time
              Row(
                children: [
                  Icon(Icons.calendar_today, color: Color(0xFF999999), size: 16),
                  SizedBox(width: 8),
                  Text(
                    '10 Oct 2025 | $checkIn -$checkOut',
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 13,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // Location
              Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFF999999), size: 16),
                  SizedBox(width: 8),
                  Text(
                    'สภาพที่ตั้งงาน',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ],
              ),
              Text(
                'Central World 1 Fl',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontFamily: 'Kanit',
                ),
              ),
              SizedBox(height: 20),

              // Job Details Section
              Text(
                'รายละเอียดงาน',
                style: TextStyle(
                  color: Color(0xFFF3C892),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit',
                ),
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint('งานเปิดตัวสินค้ารุ่วใหม่'),
                    SizedBox(height: 8),
                    _buildBulletPoint('พริตตี้ยืนต้อนรับลูกค้าและให้ข้อมูลผลิตภัณฑ์'),
                    SizedBox(height: 8),
                    _buildBulletPoint('Dress code: ชุดเดรสสีดำ'),
                    SizedBox(height: 8),
                    _buildBulletPoint('นายจ้างมีอาหารกลางวันให้'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Professional Info
              Text(
                'ข้อมูลพริตตี้',
                style: TextStyle(
                  color: Color(0xFFF3C892),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit',
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('image/pretty2.png'),
                      radius: 24,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit',
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Color(0xFFF3C892), size: 14),
                              SizedBox(width: 4),
                              Text(
                                '4.2 Rating',
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 12,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF3C892),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        'Chat',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Kanit',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Booking Details
              Text(
                'Booking Details',
                style: TextStyle(
                  color: Color(0xFFF3C892),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit',
                ),
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildDetailRow('Job ID', '67012500001'),
                    _buildDetailRow('Work Type', 'MC'),
                    _buildDetailRow('Booking Date', '20 Sep 2025 10:00'),
                    _buildDetailRow('Package Name.', 'MC 4 hours.'),
                    _buildDetailRow('Package price per hrs.', 'B 1,000.00'),
                    _buildDetailRow('Total Working hours', '10 hours'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Payment Information
              Text(
                'Payment Information',
                style: TextStyle(
                  color: Color(0xFFF3C892),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit',
                ),
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildDetailRow('Booking Price', 'B 10,000.00'),
                    _buildDetailRow('Booking Fee', 'B 500.00'),
                    Divider(color: Color(0xFF555555), height: 20),
                    _buildDetailRow('Subtotal', 'B 10,500.00'),
                    _buildDetailRow('Vat 7%', 'B 315.00'),
                    Divider(color: Color(0xFF555555), height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit',
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'B 4,815.100',
                          style: TextStyle(
                            color: Color(0xFFF3C892),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Cancellation Reason Section
              Text(
                'เหตุผลการยกเลิก',
                style: TextStyle(
                  color: Color(0xFFF3C892),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit',
                ),
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildDetailRow('เลขอ้างอิง', '20250910000001'),
                    _buildDetailRow('วันที่ยกเลิก', '28/10/2025 21:00'),
                    _buildDetailRow('เหตุผล', 'ยกเลิกสถานที่จัดงานเนื่องจากเกิดอุบัติเหตุ'),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Kanit',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xFF999999),
              fontSize: 13,
              fontFamily: 'Kanit',
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
