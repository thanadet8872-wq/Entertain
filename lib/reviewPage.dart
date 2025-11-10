import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  final String title;
  final String name;
  final String date;
  final String checkIn;
  final String checkOut;
  final String status;
  final Color statusColor;

  const ReviewPage({
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
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _bounceAnimation =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(begin: 1.0, end: 0.95),
            weight: 50,
          ),
          TweenSequenceItem(
            tween: Tween<double>(begin: 0.95, end: 1.0),
            weight: 50,
          ),
        ]).animate(
          CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
        );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

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
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Kanit',
                        fontSize: 12,
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
                  Icon(Icons.calendar_today, color: Colors.white, size: 14),
                  SizedBox(width: 8),
                  Text(
                    '10 Oct 2025 | 10:00 -18:00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),

              // Check-in/Check-out times
              Row(
                children: [
                  SizedBox(width: 22),
                  Text(
                    'Check in  09:45   Check out  18:00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),

              // Location
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white, size: 14),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'สถานที่จัดงาน',
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 11,
                          fontFamily: 'Kanit',
                        ),
                      ),
                      Text(
                        'Central World 1 Fl',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ],
                  ),
                ],
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
                            'Alena Brown',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit',
                              fontSize: 14,
                            ),
                          ),
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
              SizedBox(height: 24),

              // Review Button
              Center(
                child: ScaleTransition(
                  scale: _bounceAnimation,
                  child: GestureDetector(
                    onTap: () {
                      _bounceController.forward(from: 0.0);
                      Future.delayed(Duration(milliseconds: 200), () {
                        _showReviewDialog(context);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF3C892),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Review',
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
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _showReviewDialog(BuildContext context) {
    int rating = 0;
    TextEditingController commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Close button
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),

                    // Title
                    Text(
                      'Review',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                        fontFamily: 'Kanit',
                      ),
                    ),
                    SizedBox(height: 24),

                    // Star Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              rating = index + 1;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(
                              rating > index ? Icons.star : Icons.star_border,
                              size: 48,
                              color: rating > index
                                  ? Colors.grey[400]
                                  : Colors.grey[300],
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 24),

                    // Comment section label
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.grey[400],
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'คนล้าง',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[400],
                              fontFamily: 'Kanit',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),

                    // Comment TextField
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: commentController,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        style: TextStyle(fontFamily: 'Kanit', fontSize: 14),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                          hintText: '',
                        ),
                      ),
                    ),
                    SizedBox(height: 24),

                    // Submit Button
                    GestureDetector(
                      onTap: () {
                        // Handle submit review
                        if (rating > 0) {
                          // Add your submit logic here
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'ขอบคุณสำหรับรีวิว!',
                                style: TextStyle(fontFamily: 'Kanit'),
                              ),
                              backgroundColor: Color(0xFFF3C892),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Color(0xFFF3C892),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
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
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• ', style: TextStyle(color: Colors.white, fontSize: 14)),
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
