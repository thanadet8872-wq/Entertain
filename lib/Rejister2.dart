import 'package:flutter/material.dart';
import 'smsOTP.dart';

class VerifyPersonalInfoScreen extends StatefulWidget {
  @override
  _VerifyPersonalInfoScreenState createState() => _VerifyPersonalInfoScreenState();
}

class _VerifyPersonalInfoScreenState extends State<VerifyPersonalInfoScreen> {
  bool _hasUploadedImage = false;

  void _simulateImageUpload() {
    setState(() {
      _hasUploadedImage = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('ID Card uploaded successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161616),
      appBar: AppBar(
        backgroundColor: Color(0xFF161616),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              
              // Title
              Text(
                'Verify your personal information',
                style: TextStyle(
                  color: Color.fromARGB(201, 251, 205, 135),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: 40),
              
              // Upload ID Card Section
              Text(
                'Upload your ID Card',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              SizedBox(height: 20),
              
              // Image Upload Area
              GestureDetector(
                onTap: _simulateImageUpload,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey[600]!,
                      width: 1,
                    ),
                  ),
                  child: _hasUploadedImage
                      ? Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF3C3C3C),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'ID Card Uploaded',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFF3C3C3C),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey[400],
                                size: 40,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Select a file from your phone',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              
              SizedBox(height: 40),
              
              Spacer(),
              
              // Next Button
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 231, 169),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_hasUploadedImage) {
                      // Navigate to SMS OTP screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SMSOTPScreen(phoneNumber: "0123456789"), // หรือเบอร์โทรจริงที่ได้จากหน้าก่อน
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please upload your ID card first'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
