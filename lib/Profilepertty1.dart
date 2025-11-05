import 'package:flutter/material.dart';

class Profilepertty1 extends StatelessWidget {
  const Profilepertty1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // background image
          Positioned.fill(
            child: Image.asset('image/pretty4.png', fit: BoxFit.cover),
          ),

          // bottom gradient to darken image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
                  stops: [0.5, 1.0],
                ),
              ),
            ),
          ),

          // top bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 32),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Icon(Icons.menu, color: Colors.white, size: 32),
                ],
              ),
            ),
          ),
          // heart floating button
          Positioned(
            right: 20,
            top: size.height * 0.42,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.favorite, color: Colors.red, size: 32),
            ),
          ),

          // main scrollable content
          Positioned(
            left: 0,
            right: 0,
            top: size.height * 0.48,
            bottom: 0,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name, age, check
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('J-Net', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text('28 ปี', style: TextStyle(color: Colors.white, fontSize: 16)),
                          ],
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.check_circle, color: Colors.green, size: 20),
                      ],
                    ),
                  ),

                  SizedBox(height: 8),

                  // flags
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(children: [_flag('image/line.png'), SizedBox(width: 6), _flag('image/facebook.png'), SizedBox(width: 6), _flag('image/google.png')]),
                  ),

                  SizedBox(height: 12),

                  // chips
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(children: [_chip('MC'), SizedBox(width: 10), _chip('PC'), SizedBox(width: 10), _chip('BA')]),
                  ),

                  SizedBox(height: 14),

                  // dots indicator
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(8, (i) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: i == 3 ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: i == 3 ? Colors.white : Colors.white54,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        );
                      }),
                    ),
                  ),

                  SizedBox(height: 14),

                  // rating card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xFF232323), borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Row(
                        children: [
                          Text('เราตั้ง', style: TextStyle(color: Colors.white, fontSize: 16)),
                          SizedBox(width: 12),
                          ...List.generate(5, (i) => Icon(Icons.star, color: Colors.amber, size: 20)),
                          SizedBox(width: 8),
                          Text('(100)', style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // promo / about card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(color: Color(0xFF232323), borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('~ข้อความโปรโมท', style: TextStyle(color: Colors.amberAccent, fontSize: 15)),
                          SizedBox(height: 8),
                          Text('-ประวัติ', style: TextStyle(color: Colors.white70)),
                          Text('-ทักษะ', style: TextStyle(color: Colors.white70)),
                          Text('-ความสามารถ', style: TextStyle(color: Colors.white70)),
                          Text('-ภาษา', style: TextStyle(color: Colors.white70)),
                          Text('-ประสบการณ์', style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // packages list
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(children: [_packageCard(), SizedBox(height: 12), _packageCard()]),
                  ),

                  SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  Widget _flag(String asset) {
    return Image.asset(asset, width: 28, height: 20);
  }

  Widget _chip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF5ECD6),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Text(label, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }

  Widget _packageCard() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFFB29B6E)),
      child: Column(
        children: [
          // header bar
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(color: Color(0xFF7F6A40), borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            child: Text('แพ็คเกจ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          // white body with divider
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('-รายละเอียด', style: TextStyle(color: Colors.black54)), SizedBox(height: 8), Text('-ราคา', style: TextStyle(color: Colors.black54))]),
                ),
                // dotted divider imitation
                Container(width: 1, height: 60, color: Colors.grey[300]),
                SizedBox(width: 12),
                Column(children: [Icon(Icons.chat_bubble_outline, color: Colors.black54), SizedBox(height: 6), Text('100', style: TextStyle(color: Colors.black54))]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // home with gold background
          Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              decoration: BoxDecoration(color: Color(0xFFB29B6E), shape: BoxShape.circle),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.home, color: Colors.black),
            ),
            SizedBox(height: 6),
            Text('Home', style: TextStyle(color: Color(0xFFB29B6E)))
          ]),
          _navItem(Icons.chat_bubble_outline, 'Chat'),
          _navItem(Icons.local_fire_department, 'My Job'),
          _navItem(Icons.favorite_border, 'Favorite'),
          _navItem(Icons.person_outline, 'Profile'),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label) {
    return Column(mainAxisSize: MainAxisSize.min, children: [Icon(icon, color: Colors.white, size: 28), SizedBox(height: 6), Text(label, style: TextStyle(color: Colors.white))]);
  }
}
