import 'package:flutter/material.dart';
import 'payment_completed_dialog.dart';

class PaymentProcessingDialog extends StatefulWidget {
  const PaymentProcessingDialog({super.key});

  @override
  State<PaymentProcessingDialog> createState() => _PaymentProcessingDialogState();
}

class _PaymentProcessingDialogState extends State<PaymentProcessingDialog> {
  @override
  void initState() {
    super.initState();
    // จำลองการรอชำระเงิน 3 วินาที
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        // ปิด Dialog รอชำระเงิน
        Navigator.of(context).pop();
        // แสดง Dialog Payment Completed
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => PaymentCompletedDialog(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Loading Indicator
            Container(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                color: Color(0xFFD4AF78),
                strokeWidth: 4,
              ),
            ),
            
            SizedBox(height: 24),
            
            Text(
              'Processing Payment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Kanit',
              ),
            ),
            
            SizedBox(height: 12),
            
            Text(
              'Please wait...',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontFamily: 'Kanit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
