import 'package:flutter/material.dart';

class PaymentCompletedDialog extends StatefulWidget {
  @override
  State<PaymentCompletedDialog> createState() => _PaymentCompletedDialogState();
}

class _PaymentCompletedDialogState extends State<PaymentCompletedDialog> {
  @override
  void initState() {
    super.initState();
    // หลังจาก 1.5 วินาที ให้นำทางไปยังหน้า My Job
    Future.delayed(Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.pop(context); // ปิด dialog
        Navigator.pushNamed(context, '/myjob'); // ไปยังหน้า My Job
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
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0xFF00FF00),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: Colors.white, size: 36),
              ),
              SizedBox(height: 16),
              Text(
                'Payment completed',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
