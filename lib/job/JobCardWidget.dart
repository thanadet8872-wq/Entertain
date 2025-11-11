import 'package:flutter/material.dart';

class JobCardWidget extends StatelessWidget {
  const JobCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF8B795E),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Work Entertain App',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    fontFamily: 'Kanit',
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('On Going', style: TextStyle(color: Colors.white, fontSize: 14)),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text('10/09/2568', style: TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(width: 24),
              Text('Start 09:00', style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          Row(
            children: [
              Text('Bangkok', style: TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(width: 24),
              Text('Out 11:00', style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          SizedBox(height: 8),
          Text('3,000 บาท', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF3E2B7),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {},
                child: Text('Report Issue', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {},
                child: Text('Emergency', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
