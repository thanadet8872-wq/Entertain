import 'package:flutter/material.dart';

class PaymentCompletedDialog extends StatefulWidget {
  @override
  State<PaymentCompletedDialog> createState() => _PaymentCompletedDialogState();
}

class _PaymentCompletedDialogState extends State<PaymentCompletedDialog> {
  @override
  void initState() {
    super.initState();
    // หลังจาก 2 วินาที ให้นำทางไปยังหน้า Profile
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context); // ปิด dialog
        Navigator.pop(context); // ปิดหน้า Payment
        Navigator.pushNamed(context, '/profile'); // ไปยังหน้า Profile
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Color(0xFF4CAF50),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: Colors.white, size: 40),
              ),
              SizedBox(height: 16),
              Text(
                'Payment completed',
                style: TextStyle(
                  color: Color(0xFF4CAF50),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Kanit',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
