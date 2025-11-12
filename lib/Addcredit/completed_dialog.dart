import 'package:flutter/material.dart';

class CompletedDialog extends StatelessWidget {
  const CompletedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    });
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xFF21953A),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 32),
            ),
            SizedBox(height: 18),
            Text(
              'Add Credit Card completed',
              style: TextStyle(
                color: Color(0xFF21953A),
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
