import 'package:flutter/material.dart';
import 'Rejister2.dart';

class RegisterEmployer extends StatefulWidget {
  @override
  _RegisterEmployerState createState() => _RegisterEmployerState();
}

class _RegisterEmployerState extends State<RegisterEmployer> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  String _selectedRole = 'Employer';
  bool _acceptTerms = false;
  bool _acceptPrivacy = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              
              // Full Name Field
              _buildLabel('Full Name'),
              SizedBox(height: 8),
              _buildTextField(
                controller: _fullNameController,
                hintText: 'Enter your full name',
              ),
              
              SizedBox(height: 20),
              
              // Display Name Field
              _buildLabel('Display Name'),
              SizedBox(height: 8),
              _buildTextField(
                controller: _displayNameController,
                hintText: 'Enter your display name',
              ),
              
              SizedBox(height: 20),
              
              // Role Field
              _buildLabel('Role'),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFF666666),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedRole,
                    dropdownColor: Color(0xFF666666),
                    style: TextStyle(color: Colors.white),
                    items: ['Employer', 'Pretty'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value, 
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRole = newValue!;
                      });
                    },
                  ),
                ),
              ),
              
              SizedBox(height: 20),
              
              // Email Field
              _buildLabel('Email'),
              SizedBox(height: 8),
              _buildTextField(
                controller: _emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              
              SizedBox(height: 20),
              
              // Phone Number Field
              _buildLabel('Phone Number'),
              SizedBox(height: 8),
              _buildTextField(
                controller: _phoneController,
                hintText: 'Enter your phone number',
                keyboardType: TextInputType.phone,
              ),
              
              SizedBox(height: 20),
              
              // Password Field
              _buildLabel('Password'),
              SizedBox(height: 8),
              _buildTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white54,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              
              SizedBox(height: 20),
              
              // Confirm Password Field
              _buildLabel('Confirm Password'),
              SizedBox(height: 8),
              _buildTextField(
                controller: _confirmPasswordController,
                hintText: 'Enter confirm password',
                obscureText: _obscureConfirmPassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white54,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
              
              SizedBox(height: 30),
              
              // Terms and Conditions Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (bool? value) {
                      setState(() {
                        _acceptTerms = value ?? false;
                      });
                    },
                    activeColor: Color.fromARGB(201, 251, 205, 135),
                    checkColor: Colors.black,
                  ),
                  Expanded(
                    child: Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              
              // Privacy Policy Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _acceptPrivacy,
                    onChanged: (bool? value) {
                      setState(() {
                        _acceptPrivacy = value ?? false;
                      });
                    },
                    activeColor: Color.fromARGB(201, 251, 205, 135),
                    checkColor: Colors.black,
                  ),
                  Expanded(
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 30),
              
              // Register Button
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 231, 169),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_acceptTerms && _acceptPrivacy) {
                      if (_phoneController.text.isNotEmpty) {
                        // Navigate to Verify Personal Info screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyPersonalInfoScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please enter phone number'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please accept Terms and Conditions and Privacy Policy'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Register',
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

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    TextInputType? keyboardType,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _displayNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
