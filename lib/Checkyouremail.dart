import 'package:flutter/material.dart';
import 'setnewpassword.dart';

class CheckYourEmailScreen extends StatefulWidget {
  final String email;
  
  const CheckYourEmailScreen({Key? key, required this.email}) : super(key: key);

  @override
  _CheckYourEmailScreenState createState() => _CheckYourEmailScreenState();
}

class _CheckYourEmailScreenState extends State<CheckYourEmailScreen> {
  List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

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
                'Check your email',
                style: TextStyle(
                  color: Color.fromARGB(201, 251, 205, 135),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: 16),
              
              // Subtitle
              Text(
                'We sent a reset link to ${widget.email.isNotEmpty ? widget.email : 'test@werdev.io'}\nenter 6 digit code that mentioned in the email',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              
              SizedBox(height: 40),
              
              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                      ),
                      onChanged: (value) {
                        if (value.length == 1 && index < 5) {
                          _focusNodes[index + 1].requestFocus();
                        } else if (value.isEmpty && index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              
              SizedBox(height: 40),
              
              // Verify Code Button
              Center(
                child: Container(
                  width: 180,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 231, 169),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      String code = _controllers.map((controller) => controller.text).join();
                      if (code.length == 6) {
                        // Navigate to Set New Password screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SetNewPasswordScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter all 6 digits'),
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
                      'Verify Code',
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
              
              // Resend Email Link
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Resend email logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Reset link sent again to ${widget.email}'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    print('Resend email to: ${widget.email}');
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Haven't got the email yet? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Resend email',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}