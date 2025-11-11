import 'package:flutter/material.dart';
import '../payment_completed_dialog.dart';

class BookingReviewPage extends StatefulWidget {
  @override
  State<BookingReviewPage> createState() => _BookingReviewPageState();
}

class _BookingReviewPageState extends State<BookingReviewPage> {
  String _selectedPaymentMethod = 'Wallet';

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
          'Booking Review',
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
            // Service Provider and Details Combined
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF2D2D2D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Provider Info
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: Image.asset(
                          'image/pretty2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Alena Brown',
                              style: TextStyle(
                                color: Color(0xFFE8B574),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit',
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Color(0xFFE8B574), size: 16),
                                SizedBox(width: 4),
                                Text(
                                  '4.2',
                                  style: TextStyle(
                                    color: Color(0xFFE8B574),
                                    fontSize: 14,
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
                  SizedBox(height: 16),
                  Divider(color: Colors.grey.shade700, height: 24),
                  SizedBox(height: 8),
                  // Service Details
                  _buildDetailRow('Work Type', 'MC'),
                  SizedBox(height: 12),
                  _buildDetailRow('Pretty name', 'Alena Brown'),
                  SizedBox(height: 12),
                  _buildDetailRow('Date & Time', '29 Sep 2025 | 10:00 - 19:00'),
                  SizedBox(height: 12),
                  _buildDetailRow('Event', 'COSMEX 2025 ML FO786'),
                  SizedBox(height: 12),
                  _buildDetailRow('Location', 'Mega Bangna FL1'),
                  SizedBox(height: 12),
                  _buildDetailRow('Package price per hrs.', '฿ 1,000.00'),
                  SizedBox(height: 12),
                  _buildDetailRow('Working hours', '4 hours'),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Price Breakdown in Box
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFF2D2D2D),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Payment information',
                        style: TextStyle(
                          color: Color(0xFFE8B574),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildPriceRow('Booking Price', '฿ 4,000.00'),
                          SizedBox(height: 12),
                          _buildPriceRow('Booking Fee', '฿ 200.00'),
                          SizedBox(height: 12),
                          _buildPriceRow('Subtotal', '฿ 4,200.00'),
                          SizedBox(height: 12),
                          _buildPriceRow('Vat 7%', '฿ 294.00'),
                          Divider(color: Colors.grey.shade700, height: 24),
                          // Total
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                              Text(
                                '฿ 4,494.00',
                                style: TextStyle(
                                  color: Color(0xFFE8B574),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
            SizedBox(height: 24),

            // Payment Method Selection in Box
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF2D2D2D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Payment Title
                  Text(
                    'Payment',
                    style: TextStyle(
                      color: Color(0xFFE8B574),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit',
                    ),
                  ),
                  SizedBox(height: 12),
                  // Wallet Option
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = 'Wallet';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFF3A3A3A),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _selectedPaymentMethod == 'Wallet'
                              ? Color(0xFFE8B574)
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: _selectedPaymentMethod == 'Wallet'
                                ? Image.asset(
                                    'image/wallet.png',
                                    width: 16,
                                    height: 16,
                                    color: Color(0xFFE8B574),
                                  )
                                : SizedBox.shrink(),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wallet',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kanit',
                                  ),
                                ),
                                Text(
                                  '฿ 15,000',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontFamily: 'Kanit',
                                  ),
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
            SizedBox(height: 24),

            // Confirm Payment Button
            GestureDetector(
              onTap: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => PaymentCompletedDialog(),
                );
                await Future.delayed(Duration(milliseconds: 1500));
                if (mounted) Navigator.of(context, rootNavigator: true).pop();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFE8B574),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Confirm payment',
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

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontFamily: 'Kanit',
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String price) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontFamily: 'Kanit',
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontFamily: 'Kanit',
            ),
          ),
        ],
      ),
    );
  }
}
