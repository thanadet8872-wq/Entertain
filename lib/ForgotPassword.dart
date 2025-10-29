import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Checkyouremail.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  void openWeb(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not open the link')));
    }
  }

  final TextEditingController _emailController = TextEditingController();

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
                'Forgot Your password?',
                style: TextStyle(
                  color: Color.fromARGB(255, 245, 208, 154),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 16),

              // Subtitle
              Text(
                'Please enter your email to reset the password',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),

              SizedBox(height: 40),

              // Email Label
              Text(
                'Your Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 12),

              // Email Input Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40),

              // Reset Password Button
              Center(
                child: Container(
                  width: 180,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 231, 169),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_emailController.text.isNotEmpty) {
                        // Navigate to Check Your Email screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckYourEmailScreen(
                              email: _emailController.text,
                            ),
                          ),
                        );
                      } else {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter your email address'),
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
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              // Social Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => openWeb('https://www.facebook.com'),
                    child: Image.asset('image/facebook.png', width: 48),
                  ),
                  SizedBox(width: 16),
                  InkWell(
                    onTap: () => openWeb('https://www.google.com'),
                    child: Image.asset('image/google.png', width: 48),
                  ),
                  SizedBox(width: 16),
                  InkWell(
                    onTap: () => openWeb('https://x.com'),
                    child: Image.asset('image/x.png', width: 48),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
