import 'package:flutter/material.dart';
import 'MenuDrawer.dart';

class Profilepertty1 extends StatefulWidget {
  const Profilepertty1({super.key});

  @override
  State<Profilepertty1> createState() => _Profilepertty1State();
}

class _Profilepertty1State extends State<Profilepertty1> {
  bool isFavorite = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _packageCard() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // ขอบบนสีน้ำตาล
          Container(
            height: 38,
            decoration: BoxDecoration(
              color: Color(0xFF8B7752),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              'แพ็คเกจ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          // เนื้อหาหลักแบ่งซ้าย-ขวา
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ซ้าย: รายละเอียด/ราคา
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('-รายละเอียด', style: TextStyle(fontSize: 14, color: Colors.black87)),
                      SizedBox(height: 18),
                      Text('-ราคา', style: TextStyle(fontSize: 14, color: Colors.black87)),
                    ],
                  ),
                ),
                // ขีดประกลาง
                Container(
                  width: 1,
                  height: 70,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomPaint(
                    painter: DashedLinePainter(),
                  ),
                ),
                // ขวา: ข้อมูลสถิติ + ไอคอน chat
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text('อัตราการสำเร็จงาน', style: TextStyle(fontSize: 11, color: Colors.black54)),
                      SizedBox(height: 2),
                      Text('100 %', style: TextStyle(fontSize: 13, color: Colors.black87)),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('การรับงาน', style: TextStyle(fontSize: 10, color: Colors.black54)),
                              Text('100', style: TextStyle(fontSize: 11, color: Colors.black87)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('การทำงานซ้ำ', style: TextStyle(fontSize: 10, color: Colors.black54)),
                              Text('100', style: TextStyle(fontSize: 11, color: Colors.black87)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/chat');
                          },
                          child: Image.asset(
                            'image/chat.png',
                            width: 24,
                            height: 24,
                            color: Colors.black54,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      endDrawer: MenuDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'image/pretty4.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.55),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.75),
                        Colors.black.withOpacity(0.9),
                      ],
                      stops: [0.0, 0.5],
                    ),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  padding: EdgeInsets.only(top: 16, bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ธงชาติ + ชื่อ + อายุ + เครื่องหมาย (ด้านบน)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ชื่อ + เครื่องหมาย + อายุ (ด้านบน)
                            Row(
                              children: [
                                Text('J-Net', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                                SizedBox(width: 6),
                                Icon(Icons.check_circle, color: Colors.green, size: 20),
                                SizedBox(width: 12),
                                Text('28 ปี', style: TextStyle(fontSize: 18, color: Colors.white70)),
                              ],
                            ),
                            SizedBox(height: 8),
                            // ธงชาติ (ด้านล่าง)
                            Row(
                              children: [
                                Text('🇹🇭', style: TextStyle(fontSize: 18)),
                                SizedBox(width: 6),
                                Text('🇬🇧', style: TextStyle(fontSize: 18)),
                                SizedBox(width: 6),
                                Text('🇩🇪', style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 12),

                      // ปุ่ม MC, PC, BA + หัวใจ
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5E6D3),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Text('MC', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87)),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5E6D3),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Text('PC', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87)),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5E6D3),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Text('BA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black87)),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),

                      // จุดระดับ (Indicator dots)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(7, (index) => 
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              child: Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      // แถบรีวิวดาว (ในกล่องสีเทา)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0xFF2A2A2A).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text('เรตติ้ง', style: TextStyle(fontSize: 12, color: Colors.white70)),
                            SizedBox(width: 8),
                            Row(
                              children: List.generate(5, (index) =>
                                Icon(Icons.star, color: Color(0xFFFFC857), size: 13),
                              ),
                            ),
                            SizedBox(width: 6),
                            Text('(100)', style: TextStyle(fontSize: 11, color: Colors.white70)),
                          ],
                        ),
                      ),

                      SizedBox(height: 12),

                      // กล่องโปรโมท
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF2A2A2A).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('~ข้อความโปรโมท', style: TextStyle(color: Color(0xFFFFC857), fontSize: 13)),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 12),

                      // กล่องประวัติ
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF2A2A2A).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('~ข้อความประวัติ', style: TextStyle(color: Color(0xFFFFC857), fontSize: 13)),
                              SizedBox(height: 8),
                              Text('-ประวัติ', style: TextStyle(color: Colors.white70, fontSize: 12)),
                              SizedBox(height: 3),
                              Text('-ทักษะ', style: TextStyle(color: Colors.white70, fontSize: 12)),
                              SizedBox(height: 3),
                              Text('-ความสามารถ', style: TextStyle(color: Colors.white70, fontSize: 12)),
                              SizedBox(height: 3),
                              Text('-ภาษา', style: TextStyle(color: Colors.white70, fontSize: 12)),
                              SizedBox(height: 3),
                              Text('-ประสบการณ์', style: TextStyle(color: Colors.white70, fontSize: 12)),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 18),

                      // กล่องแพ็คเกจ
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            _packageCard(),
                            SizedBox(height: 16),
                            _packageCard(),
                          ],
                        ),
                      ),

                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // top bar - fixed on top
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.white, size: 28),
                    onPressed: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1A1A1A),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              iconWidget: Icon(
                Icons.home,
                color: Colors.white70,
                size: 24,
              ),
              label: 'Home',
              isActive: false,
              onTap: () {
                Navigator.pushNamed(context, '/welcome');
              },
            ),
            _navItem(
              iconWidget: Image.asset(
                'image/chat.png',
                width: 24,
                height: 24,
                color: Colors.white70,
              ),
              label: 'Chat',
              isActive: false,
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
            ),
            _navItem(
              iconWidget: Icon(
                Icons.local_fire_department,
                color: Colors.white70,
                size: 24,
              ),
              label: 'myJob',
              isActive: false,
              onTap: () {
                Navigator.pushNamed(context, '/myjob');
              },
            ),
            _navItem(
              iconWidget: Icon(
                Icons.favorite_border,
                color: Colors.white70,
                size: 24,
              ),
              label: 'Favorite',
              isActive: false,
              onTap: () {
                Navigator.pushNamed(context, '/favorite');
              },
            ),
            _navItem(
              iconWidget: Icon(
                Icons.person,
                color: Colors.white70,
                size: 24,
              ),
              label: 'Profile',
              isActive: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required Widget iconWidget,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconWidget,
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Color(0xFFD4AF37) : Colors.white70,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CustomPainter สำหรับขีดประกลางกล่องแพ็คเกจ
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 6, dashSpace = 4, startY = 0;
    final paint = Paint()
      ..color = Color(0xFF8B7752)
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
