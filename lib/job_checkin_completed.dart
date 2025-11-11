import 'package:flutter/material.dart';
import 'chat/Chat.dart';
import 'cancelJob.dart';
import 'reviewPage.dart';
import 'MenuDrawer.dart';

class JobCheckinCompletedPage extends StatefulWidget {
  final String title;
  final String name;
  final String date;
  final String checkIn;
  final String checkOut;
  final String status;
  final Color statusColor;

  const JobCheckinCompletedPage({
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
  State<JobCheckinCompletedPage> createState() =>
      _JobCheckinCompletedPageState();
}

class _JobCheckinCompletedPageState extends State<JobCheckinCompletedPage> {
  late String title;
  late String name;
  late String date;
  late String checkIn;
  late String checkOut;
  late String status;
  late Color statusColor;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    name = widget.name;
    date = widget.date;
    checkIn = widget.checkIn;
    checkOut = widget.checkOut;
    status = widget.status;
    statusColor = widget.statusColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      endDrawer: MenuDrawer(),
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
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Title Section - Compact Top View
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF00AA00).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xFF00AA00), width: 1),
                      ),
                      child: Text(
                        'On Going',
                        style: TextStyle(
                          color: Color(0xFF00AA00),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  'Job ID: 67012500001',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontFamily: 'Kanit',
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Color(0xFFF3C892),
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Text(
                              '$date | $checkIn - $checkOut',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Check in  09:45',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontFamily: 'Kanit',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_on, color: Color(0xFFF3C892), size: 16),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'สถานที่จัดงาน',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            'Mega Bangna FL.1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          Text(
                            'ดูเส้นทาง',
                            style: TextStyle(
                              color: Color(0xFFE9C78E),
                              fontSize: 11,
                              fontFamily: 'Kanit',
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle Emergency button tap
                        _showEmergencyDialog(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Emergency',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Job Description Section
            Text(
              'รายละเอียดงาน',
              style: TextStyle(
                color: Color(0xFFE9C78E),
                fontSize: 16,
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
                  _buildBulletPoint('งานเปิิดตัวสินค้าใหม่'),
                  SizedBox(height: 8),
                  _buildBulletPoint(
                    'พริตตี้ยืนต้อนรับลูกค้าและให้ข้อมูลผลิตภัณฑ์',
                  ),
                  SizedBox(height: 8),
                  _buildBulletPoint('Dress code: ชุดแนวเดรสสีดำ'),
                  SizedBox(height: 8),
                  _buildBulletPoint('นายจ้างมีอาหารว่างให้บริการระหว่างวัน'),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Employer Section
            Text(
              'ข้อมูลพริตตี้',
              style: TextStyle(
                color: Color(0xFFE9C78E),
                fontSize: 16,
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
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('image/pretty2.png'),
                    radius: 24,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alena Brown',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit',
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFFF3C892),
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '4.2 Rating',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontFamily: 'Kanit',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF3C892),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Chat',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Booking Details Section
            Text(
              'Booking Details',
              style: TextStyle(
                color: Color(0xFFE9C78E),
                fontSize: 16,
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
                  _buildDetailRow('Package price per hrs.', '฿ 1,000.00'),
                  _buildDetailRow('Total Working hours', '10 hours'),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Payment Information Section
            Text(
              'Payment information',
              style: TextStyle(
                color: Color(0xFFE9C78E),
                fontSize: 16,
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
                  _buildDetailRow('Booking Price', '฿ 10,000.00'),
                  _buildDetailRow('Booking Fee', '฿ 500.00'),
                  Divider(color: Colors.white30, height: 20),
                  _buildDetailRow('Subtotal', '฿ 10,500.00'),
                  _buildDetailRow('Vat 7%', '฿ 315.00'),
                  Divider(color: Colors.white30, height: 20),
                  _buildDetailRow('Total', '฿ 4,815.100', isTotal: true),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Action Buttons - Changed to Report and Finish
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _showReportDialog(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Color(0xFF2D2D2D),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFFF3C892), width: 1),
                      ),
                      child: Center(
                        child: Text(
                          'Report',
                          style: TextStyle(
                            color: Color(0xFFF3C892),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _showFinishConfirmationDialog(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Color(0xFFF3C892),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Finish',
                          style: TextStyle(
                            color: Color(0xFF232323),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kanit',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 6, right: 12),
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Kanit',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white70,
              fontSize: isTotal ? 14 : 12,
              fontFamily: 'Kanit',
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isTotal ? Color(0xFFF3C892) : Colors.white,
              fontSize: isTotal ? 16 : 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Kanit',
            ),
          ),
        ],
      ),
    );
  }

  void _showFinishSuccessDialog(BuildContext context) {
    // นำไปยัง ReviewPage โดยตรง
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ReviewPage(
          title: title,
          name: 'Alena Brown',
          date: date,
          checkIn: checkIn,
          checkOut: checkOut,
          status: 'Completed',
          statusColor: Color(0xFF00AA00),
        ),
      ),
    );
  }

  void _showFinishConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF2D2D2D),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'คุณต้องการยืนยันการจบงานใช่หรือไม่?',
                  style: TextStyle(
                    color: Color(0xFFE9C78E),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'เมื่อยืนยันแล้วจะไม่สามารถแก้ไขรายละเอียดงานได้อีก',
                  style: TextStyle(
                    color: Color(0xFFE9C78E),
                    fontSize: 13,
                    fontFamily: 'Kanit',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFF3C892),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'ยกเลิก',
                              style: TextStyle(
                                color: Color(0xFFF3C892),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          _showFinishSuccessDialog(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(0xFFF3C892),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Finish',
                              style: TextStyle(
                                color: Color(0xFF232323),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSubmitSuccessDialog(BuildContext pageContext) {
    showDialog(
      context: pageContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Green checkmark circle
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFF00AA00),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 50),
                ),
                SizedBox(height: 24),
                // Success text
                Text(
                  'Send report complete',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );

    // Auto-close and navigate after 1.5 seconds
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pop(pageContext); // Close success dialog
      Navigator.of(pageContext).pushReplacement(
        MaterialPageRoute(
          builder: (context) => CancelJobPage(
            title: title,
            name: 'Alena Brown',
            date: date,
            checkIn: checkIn,
            checkOut: checkOut,
            status: 'Cancelled',
            statusColor: Color.fromARGB(210, 254, 134, 134),
          ),
        ),
      );
    });
  }

  void _showReportDialog(BuildContext pageContext) {
    final TextEditingController reportTitleController = TextEditingController();
    final TextEditingController reportDetailsController =
        TextEditingController();
    final TextEditingController reportAttachmentController =
        TextEditingController();

    showDialog(
      context: pageContext,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF2D2D2D),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(24),
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with title and close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Report',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(dialogContext),
                      child: Icon(
                        Icons.close,
                        color: Color(0xFFF3C892),
                        size: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // ประเภทของปัญหา
                Text(
                  'ประเภทของปัญหา',
                  style: TextStyle(
                    color: Color(0xFFF3C892),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit',
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: reportTitleController,
                  style: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'Kanit',
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // รายละเอียด
                Text(
                  'รายละเอียด',
                  style: TextStyle(
                    color: Color(0xFFF3C892),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit',
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: reportDetailsController,
                  style: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                  maxLines: 4,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'Kanit',
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // แนบรูป
                Text(
                  'แนบรูป',
                  style: TextStyle(
                    color: Color(0xFFF3C892),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit',
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: reportAttachmentController,
                  style: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'Kanit',
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Submit Button
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(dialogContext); // ปิด Report Dialog
                      // แสดง Success Dialog
                      _showSubmitSuccessDialog(pageContext);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF3E2B7),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 60),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(20),
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close button
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, color: Colors.white, size: 18),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                // Warning icon
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.warning, color: Colors.red, size: 40),
                ),
                SizedBox(height: 16),
                // Title
                Text(
                  'EMERGENCY',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit',
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                // SOS Button
                GestureDetector(
                  onTap: () {
                    // Handle SOS button tap
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('SOS signal sent!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF3E2B7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'SOS',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
