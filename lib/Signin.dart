import 'package:flutter/material.dart';
import 'RegisterEmployer.dart';
import 'ForgotPassword.dart';



class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161616),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF161616),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                SizedBox(height: 60),
                
                // Logo
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('image/Logo_app.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                SizedBox(height: 40),
                
              
                SizedBox(height: 8),
    
                // Email Field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Email or Username',
                      hintStyle: TextStyle(color: Colors.white54),
                      prefixIcon: Icon(Icons.person, color: const Color.fromARGB(255, 252, 252, 252)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                
                SizedBox(height: 20),
                
                // Password Field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white54),
                      prefixIcon: Icon(Icons.lock, color: const Color.fromARGB(255, 255, 255, 255)),
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
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                
                SizedBox(height: 30),
                
                // Sign In Button
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 255, 231, 169), 
                        const Color.fromARGB(255, 255, 231, 169)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Sign In pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 20),
                
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: const Color.fromARGB(201, 251, 205, 135),
                      fontSize: 16,
                    ),
                  ),
                ),
                
                SizedBox(height: 30),
                
                // Social Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _socialButton('image/facebook.png'),
                    _socialButton('image/google.png'),
                    _socialButton('image/twitter.png'),
                  ],
                ),
                
                SizedBox(height: 30),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: const Color.fromARGB(201, 251, 205, 135)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterEmployer()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: const Color.fromARGB(201, 251, 205, 135),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String imagePath) {
    return GestureDetector(
      onTap: () {
        // ระบุชื่อ social media platform จาก imagePath
        String platform = '';
        if (imagePath.contains('facebook')) {
          platform = 'Facebook';
        } else if (imagePath.contains('google')) {
          platform = 'Google';
        } else if (imagePath.contains('twitter')) {
          platform = 'Twitter';
        }
        print('$platform login pressed');
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24),
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
