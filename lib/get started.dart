import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'Signin.dart';
class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  String? selectedRole;
  
  // List of image URLs
  final List<String> _imageUrls = [
    'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=500&h=500&fit=crop&crop=face', // ผู้หญิงชุดม่วง
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300&h=300&fit=crop&crop=face', // ผู้หญิงผมสั้น
    'https://images.unsplash.com/photo-1488716820095-cbe80883c496?w=300&h=300&fit=crop&crop=face', // ผู้หญิงผมยาว
  ];
  
  int _currentImageIndex = 0;
  
  // ตัวแปรสำหรับบังคับให้ animation restart
  int _starAnimationKey = 0;
  int _curveAnimationKey = 0;

  @override
  void initState() {
    super.initState();
    print('🚀 Starting image rotation...');
    print('📱 Initial images:');
    print('   Center: ${_imageUrls[0]}');
    print('   Left: ${_imageUrls[1]}');
    print('   Right: ${_imageUrls[2]}');
    
    // เริ่ม timer สำหรับสลับรูปภาพ
    _startImageRotation();
  }

  void _startImageRotation() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentImageIndex = (_currentImageIndex + 1) % _imageUrls.length;
          print('🔄 Image index changed to: $_currentImageIndex');
          print('📸 Center image: ${_getImageUrl(0)}');
          print('📸 Left image: ${_getImageUrl(1)}');
          print('📸 Right image: ${_getImageUrl(2)}');
        });
        _startImageRotation(); // วนลูปต่อเนื่อง
      }
    });
  }

  // คำนวณ URL รูปภาพสำหรับแต่ละตำแหน่ง
  String _getImageUrl(int position) {
    // position: 0=center, 1=left, 2=right
    // สร้างการสลับแบบ: center -> left -> right -> center
    int index;
    switch (position) {
      case 0: // center
        index = _currentImageIndex;
        break;
      case 1: // left (next image)
        index = (_currentImageIndex + 1) % _imageUrls.length;
        break;
      case 2: // right (previous image)
        index = (_currentImageIndex + 2) % _imageUrls.length;
        break;
      default:
        index = _currentImageIndex;
    }
    return _imageUrls[index];
  }

  // คำนวณขนาดรูปภาพตามตำแหน่ง
  double _getImageSize(int position) {
    // position: 0=center, 1=left, 2=right
    switch (position) {
      case 0: return 200.0; // center - ใหญ่สุด
      case 1: return 95.0;  // left
      case 2: return 85.0;  // right
      default: return 100.0;
    }
  }





  // สร้างดาวระยิบระยับ
  List<Widget> _buildStars() {
    return List.generate(8, (index) {
      final angle = (index * 45.0) * (math.pi / 180); // แต่ละดาวห่าง 45 องศา
      final radius = 120.0; // ระยะห่างจากกลาง
      final x = radius * math.cos(angle);
      final y = radius * math.sin(angle);
      
      return Positioned(
        left: 100 + x - 8, // 100 คือจุดกลางของรูป - 8 เพื่อให้ดาวอยู่กลาง
        top: 100 + y - 8,
        child: TweenAnimationBuilder<double>(
          key: ValueKey('star_${_starAnimationKey}_$index'),
          duration: Duration(milliseconds: 1500),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          builder: (context, animValue, child) {
            // สร้าง delay ให้แต่ละดาวแตกต่างกัน
            final delay = (index * 0.125) % 1.0; // 0.125 = 1/8
            final adjustedValue = (animValue + delay) % 1.0;
            
            return Transform.scale(
              scale: 0.7 + (math.sin(adjustedValue * 2 * math.pi) * 0.15 + 0.15), // ขยายจาก 0.7-1.0
              child: Opacity(
                opacity: 0.5 + (math.sin(adjustedValue * 2 * math.pi) * 0.25 + 0.25), // ความโปร่งใสจาก 0.5-1.0
                child: Icon(
                  Icons.star,
                  color: index % 2 == 0 ? Colors.amber[300] : Colors.yellow[200], // สีสลับกัน
                  size: 12 + (index % 3) * 2, // ขนาดต่างกัน 12, 14, 16
                ),
              ),
            );
          },
          onEnd: () {
            // เมื่อ animation จบ ให้เริ่มใหม่
            if (mounted) {
              setState(() {
                _starAnimationKey++; // เปลี่ยน key เพื่อ restart animation
              });
            }
          },
        ),
      );
    });
  }



  void _handleSelection(String role) {
    // นำทางไปหน้า Sign In
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2a2a2a), // Dark smoky gray at top
              Color(0xFF1f1f1f), // Darker gray
              Color(0xFF151515), // Very dark gray
              Color(0xFF0a0a0a), // Almost black
              Color(0xFF000000), // Pure black at bottom
            ],
            stops: [0.0, 0.25, 0.5, 0.75, 1.0],
          ),
        ),
        child: SafeArea(
        child: Stack(
          children: [

            
            // Background decorative elements - ตำแหน่งและสีเหมือนในรูป
            Positioned(
              top: 70,
              right: 30,
              child: Icon(Icons.star, color: Color(0xFFFFD700), size: 20),
            ),
            Positioned(
              top: 280,
              left: 25,
              child: Icon(Icons.favorite, color: Color(0xFFE74C3C), size: 16),
            ),
            Positioned(
              bottom: 220,
              right: 35,
              child: Icon(Icons.star, color: Color(0xFFFFB800), size: 14),
            ),
            Positioned(
              top: 140,
              left: 15,
              child: Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: 300,
              left: 60,
              child: Container(
                width: 3,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 200,
              right: 70,
              child: Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            
            // Main content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // รูปภาพด้านบน
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // รูปภาพวงกลม 3 รูปแบบใน Stack                         

                          Stack(
                            alignment: Alignment.center,
                            children: [
                              // 🖼️ รูปภาพกลาง - Animated fade และ scale
                              Positioned(
                                top: 100,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 800),
                                    transitionBuilder: (Widget child, Animation<double> animation) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: ScaleTransition(
                                          scale: animation,
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      key: ValueKey('center_$_currentImageIndex'),
                                      width: _getImageSize(0),
                                      height: _getImageSize(0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 4),
                                        image: DecorationImage(
                                          image: NetworkImage(_getImageUrl(0)),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.4),
                                            spreadRadius: 3,
                                            blurRadius: 20,
                                            offset: Offset(0, 8),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                              // 🖼️ รูปภาพซ้าย - Animated slide
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 1000),
                                curve: Curves.easeInOut,
                                top: 50,
                                left: 20,
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 600),
                                  child: Container(
                                    key: ValueKey('left_$_currentImageIndex'),
                                    width: _getImageSize(1),
                                    height: _getImageSize(1),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 3),
                                      image: DecorationImage(
                                        image: NetworkImage(_getImageUrl(1)),
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.35),
                                          spreadRadius: 2,
                                          blurRadius: 12,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              
                              // 🖼️ รูปภาพขวา - Animated slide
                              AnimatedPositioned(
                                duration: Duration(milliseconds: 1000),
                                curve: Curves.easeInOut,
                                top: 40,
                                right: 25,
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 600),
                                  child: Container(
                                    key: ValueKey('right_$_currentImageIndex'),
                                    width: _getImageSize(2),
                                    height: _getImageSize(2),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 3),
                                      image: DecorationImage(
                                        image: NetworkImage(_getImageUrl(2)),
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.35),
                                          spreadRadius: 2,
                                          blurRadius: 12,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // ดาวระยิบระยับรอบรูปภาพกลาง ⭐
                              ..._buildStars(),
                              ],
                          ),
                          
                          // เส้นโค้งตกแต่งแบบในรูป - หมุนรอบตัวเอง
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: TweenAnimationBuilder<double>(
                              key: ValueKey('curve_$_curveAnimationKey'),
                              duration: Duration(seconds: 8),
                              tween: Tween<double>(begin: 0.0, end: 2 * math.pi),
                              builder: (context, rotationValue, child) {
                                return CustomPaint(
                                  size: Size(double.infinity, 350),
                                  painter: CurvesPainter(rotationValue),
                                );
                              },
                              onEnd: () {
                                // เมื่อหมุนครบรอบ ให้เริ่มใหม่
                                if (mounted) {
                                  setState(() {
                                    _curveAnimationKey++; // เปลี่ยน key เพื่อ restart animation
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // ข้อความต้อนรับ
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Text(
                          'Welcome to Entertain',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'The premium platform for hiring professional pretties and MCs turning every event into a flawless impression',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 14,
                              height: 1.6,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // ปุ่มเลือก
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [
                        // ปุ่ม Employer - สีทองเหมือนในรูปจริง
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedRole = 'Employer';
                              });
                              _handleSelection('Employer');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 255, 231, 169), // สีทองเหมือนในรูป
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 6,
                              shadowColor: Color(0xFFDAA520).withOpacity(0.4),
                            ),
                            child: Text(
                              'Employer',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        
                        // ปุ่ม Pretty - สีขาวเหมือนในรูปจริง
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedRole = 'Pretty';
                              });
                              _handleSelection('Pretty');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(247, 255, 243, 214),
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 6,
                              shadowColor: Colors.black.withOpacity(0.25),
                            ),
                            child: Text(
                              'Pretty',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }

}

// Custom painter สำหรับเส้นโค้งตกแต่งตามค่า CSS ที่กำหนด - พร้อมการหมุน
class CurvesPainter extends CustomPainter {
  final double rotationValue;
  
  CurvesPainter(this.rotationValue);
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 2.0 // Border: 2px
      ..style = PaintingStyle.stroke;

    // บันทึกสถานะ canvas เพื่อการหมุน
    canvas.save();
    
    // กำหนดจุดศูนย์กลางสำหรับการหมุน
    final centerX = size.width * 0.5;
    final centerY = size.height * 0.5;
    
    // เลื่อนจุดศูนย์กลาง
    canvas.translate(centerX, centerY);
    
    // หมุน -142.93 องศา + rotation animation (แปลงเป็น radians)
    canvas.rotate((-142.93 * math.pi / 180) + rotationValue);
    
    // กำหนดขนาดตามค่า CSS: Width: 672.76px, Height: 580.42px
    // ปรับสเกลให้เหมาะกับขนาดหน้าจอ
    final ellipseWidth = size.width * 1.8; // 672.76px scaled
    final ellipseHeight = size.height * 1.6; // 580.42px scaled
    
    // วาดรูปไข่ (ellipse) แทนการใช้ quadraticBezierTo
    final rect = Rect.fromCenter(
      center: Offset(0, 0),
      width: ellipseWidth,
      height: ellipseHeight,
    );
    
    canvas.drawOval(rect, paint);
    
    // เส้นโค้งเสริมเพิ่มเติม
    final paint2 = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    
    // วาดวงรีเล็กกว่าข้างใน
    final innerRect = Rect.fromCenter(
      center: Offset(0, 0),
      width: ellipseWidth * 0.7,
      height: ellipseHeight * 0.7,    
    );
    
    canvas.drawOval(innerRect, paint2);
    
    // กู้คืนสถานะ canvas
    canvas.restore();
    
    // เพิ่มเส้นโค้งเล็กๆ ที่ไม่หมุน
    final paint3 = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
      
    final path3 = Path();
    path3.moveTo(size.width * 0.1, size.height * 0.3);
    path3.quadraticBezierTo(
      size.width * 0.5, 
      size.height * 0.2, 
      size.width * 0.9, 
      size.height * 0.4
    );
    
    canvas.drawPath(path3, paint3);
    
    // เพิ่มเส้นโค้งอีกเส้น
    final path4 = Path();
    path4.moveTo(size.width * 0.2, size.height * 0.7);
    path4.quadraticBezierTo(
      size.width * 0.6, 
      size.height * 0.8, 
      size.width * 0.8, 
      size.height * 0.6
    );
    
    canvas.drawPath(path4, paint3);
  }

  @override
  bool shouldRepaint(covariant CurvesPainter oldDelegate) => 
      oldDelegate.rotationValue != rotationValue;
}