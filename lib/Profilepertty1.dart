import 'package:flutter/material.dart';

class Profilepertty1 extends StatefulWidget {
  const Profilepertty1({super.key});

  @override
  State<Profilepertty1> createState() => _Profilepertty1State();
}

class _Profilepertty1State extends State<Profilepertty1> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image - fixed position
          Positioned.fill(
            child: Image.asset(
              'image/pretty4.png',
              fit: BoxFit.cover,
            ),
          ),

          // Main scrollable content that overlays the image
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacer to show image at top
                SizedBox(height: size.height * 0.55),

                // Content section with semi-transparent dark background
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
                      // Heart button that moves with content
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0, bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: isFavorite ? Colors.red : Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.red,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.white : Colors.red,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // name, age, verified
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text('J-Net', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(width: 6),
                            Icon(Icons.check_circle, color: Colors.green, size: 18),
                          ],
                        ),
                      ),

                      SizedBox(height: 4),

                      // age
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('28 ปี', style: TextStyle(color: Colors.white70, fontSize: 14)),
                      ),

                      SizedBox(height: 10),

                      // flags
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            _flag('🇹🇭'),
                            SizedBox(width: 8),
                            _flag('🇩🇪'),
                            SizedBox(width: 8),
                            _flag('🇪🇸'),
                          ],
                        ),
                      ),

                      SizedBox(height: 12),

                      // chips - service types
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            _chip('MC'),
                            SizedBox(width: 10),
                            _chip('PC'),
                            SizedBox(width: 10),
                            _chip('BA'),
                          ],
                        ),
                      ),

                      SizedBox(height: 14),

                      // dots indicator
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(8, (i) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              width: i == 0 ? 10 : 7,
                              height: 7,
                              decoration: BoxDecoration(
                                color: i == 0 ? Colors.white : Colors.white38,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            );
                          }),
                        ),
                      ),

                      SizedBox(height: 14),

                      // rating card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF2A2A2A).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          child: Row(
                            children: [
                              Text('เราตั้ง', style: TextStyle(color: Colors.white, fontSize: 13)),
                              SizedBox(width: 10),
                              ...List.generate(5, (i) => Padding(
                                padding: EdgeInsets.only(right: 2),
                                child: Icon(Icons.star, color: Colors.amber, size: 16),
                              )),
                              SizedBox(width: 6),
                              Text('(100)', style: TextStyle(color: Colors.white60, fontSize: 12)),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 12),

                      // promo / about card
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

                      SizedBox(height: 12),

                      // packages list
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            _packageCard(),
                            SizedBox(height: 12),
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
                    onPressed: () {},
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

  Widget _flag(String emoji) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        emoji,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _chip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      decoration: BoxDecoration(
        color: Color(0xFFF5E6D3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _packageCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFB29B6E),
      ),
      child: Column(
        children: [
          // header bar
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            decoration: BoxDecoration(
              color: Color(0xFF7F6A40),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Text(
              'แพ็คเกจ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          // white body with content
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '-รายละเอียด',
                        style: TextStyle(color: Colors.black87, fontSize: 12),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '-ราคา',
                        style: TextStyle(color: Colors.black87, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                // vertical divider
                Container(
                  width: 1,
                  height: 45,
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),
                // chat icon and number
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat_bubble_outline, color: Colors.black54, size: 22),
                    SizedBox(height: 4),
                    Text(
                      '100',
                      style: TextStyle(color: Colors.black54, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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
              icon: Icons.home,
              label: 'Home',
              isActive: false,
              onTap: () {
                // Navigate to Home
                Navigator.pushNamed(context, '/home');
              },
            ),
            _navItem(
              icon: Icons.chat_bubble_outline,
              label: 'Chat',
              isActive: false,
              onTap: () {
                // Navigate to Chat
                Navigator.pushNamed(context, '/chat');
              },
            ),
            _navItem(
              icon: Icons.local_fire_department,
              label: 'myJob',
              isActive: false,
              onTap: () {
                // Navigate to My Job
                Navigator.pushNamed(context, '/myjob');
              },
            ),
            _navItem(
              icon: Icons.favorite_border,
              label: 'Favorite',
              isActive: false,
              onTap: () {
                // Navigate to Favorite
                Navigator.pushNamed(context, '/favorite');
              },
            ),
            _navItem(
              icon: Icons.person,
              label: 'Profile',
              isActive: true, // Current page
              onTap: () {
                // Already on Profile page
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
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
            Icon(
              icon,
              color: isActive ? Color(0xFFD4AF37) : Colors.white70,
              size: 24,
            ),
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
