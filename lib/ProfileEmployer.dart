import 'package:flutter/material.dart';
import 'MenuDrawer.dart';

class ProfileEmployer extends StatefulWidget {
  const ProfileEmployer({super.key});

  @override
  State<ProfileEmployer> createState() => _ProfileEmployerState();
}

class _ProfileEmployerState extends State<ProfileEmployer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      endDrawer: MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF2C2C2E),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Kanit',
          ),
        ),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Card
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey[700],
                    backgroundImage: AssetImage('image/profile_employer.png'),
                    onBackgroundImageError: (exception, stackTrace) {},
                    child: Icon(Icons.person, size: 40, color: Colors.grey[500]),
                  ),
                  SizedBox(width: 16),
                  
                  // Info Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name and Badges Row
                        Row(
                          children: [
                            Text(
                              'leon s kennedy',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Kanit',
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: Color(0xFF4CAF50),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Verify',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: Color(0xFF5A5A5C),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Free',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        
                        // Email
                        Text(
                          'leon@residentevil2.com',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                            fontFamily: 'Kanit',
                          ),
                        ),
                        SizedBox(height: 4),
                        
                        // Employer Label
                        Text(
                          'Employer',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                            fontFamily: 'Kanit',
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Arrow Icon
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 8),
            
            // My Wallet Card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF9B8567), Color(0xFFD4B896), Color(0xFFF5E6D3)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Wallet',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Kanit',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '฿15,000.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24),
            
            // Combined Menu Container
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Billing Section
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                    child: Text(
                      'Billing',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                  _buildMenuItemInline(
                    icon: Icons.credit_card,
                    title: 'Credit Card',
                    onTap: () {},
                  ),
                  
                  Divider(color: Color(0xFF3A3A3C), height: 1, thickness: 1),
                  
                  // Setting Section
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                    child: Text(
                      'Setting',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                  _buildMenuItemInline(
                    icon: Icons.lock_outline,
                    title: 'Change Password',
                    onTap: () {},
                  ),
                  Divider(color: Color(0xFF3A3A3C), height: 1, thickness: 1, indent: 16, endIndent: 16),
                  _buildMenuItemInline(
                    icon: Icons.language,
                    title: 'Change language',
                    onTap: () {},
                  ),
                  Divider(color: Color(0xFF3A3A3C), height: 1, thickness: 1, indent: 16, endIndent: 16),
                  _buildMenuItemInline(
                    icon: Icons.notifications_none,
                    title: 'Notification',
                    onTap: () {},
                  ),
                  
                  Divider(color: Color(0xFF3A3A3C), height: 1, thickness: 1),
                  
                  // Support Section
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
                    child: Text(
                      'Support',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                  _buildMenuItemInline(
                    icon: Icons.help_outline,
                    title: 'FAQ',
                    onTap: () {},
                  ),
                  Divider(color: Color(0xFF3A3A3C), height: 1, thickness: 1, indent: 16, endIndent: 16),
                  _buildMenuItemInline(
                    icon: Icons.contact_support_outlined,
                    title: 'Contact Us',
                    onTap: () {},
                    isLast: true,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24),
            
            // VIP Plan Card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              height: 240, // Increased height to prevent overflow
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFA89178), Color(0xFFBEAA8E), Color(0xFFD4C4A8), Color(0xFFE8DCC8)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Background image on the right
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Color(0xFF6B5D4F), // Brown color
                          BlendMode.srcATop,
                        ),
                        child: Image.asset(
                          'image/VIPicon.png',
                          height: 240,
                          fit: BoxFit.cover,
                          alignment: Alignment.centerRight,
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                  ),
                  
                  // Content
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'VIP Plan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit',
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.check, color: Colors.white, size: 16),
                                SizedBox(width: 6),
                                Text(
                                  'Voice Call',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Kanit',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                Icon(Icons.check, color: Colors.white, size: 16),
                                SizedBox(width: 6),
                                Text(
                                  'Unlimited Favorite',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Kanit',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              '฿99 / Month',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit',
                              ),
                            ),
                          ],
                        ),
                        
                        // Upgrade Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/upgrade');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFE8D4B8),
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Upgrade Plan',
                              style: TextStyle(
                                color: Color(0xFF3C3C3C),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Kanit',
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
            
            SizedBox(height: 24),
            
            // Delete Account Button
            InkWell(
              onTap: () {
                _showDeleteAccountDialog();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Color(0xFF2C2C2E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Color(0xFF3A3A3C),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Delete Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[600],
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 16),
            
            // Logout Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showLogoutDialog();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE8D4B8),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Color(0xFF3C3C3C),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit',
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
  
  Widget _buildMenuItemInline({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Color(0xFF3A3A3C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Kanit',
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[600],
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', false, () {
                Navigator.pushNamed(context, '/welcome');
              }),
              _buildNavItem(Icons.chat_bubble_outline, 'Chat', false, () {
                Navigator.pushNamed(context, '/chat');
              }),
              _buildNavItem(Icons.work_outline, 'My Job', false, () {
                Navigator.pushNamed(context, '/myjob');
              }),
              _buildNavItem(Icons.favorite_border, 'Favorite', false, () {
                Navigator.pushNamed(context, '/favorite');
              }),
              _buildNavItem(Icons.person, 'Profile', true, () {}),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildNavItem(IconData icon, String label, bool isActive, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? Color(0xFFD4AF78) : Colors.grey[400],
            size: 24,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Color(0xFFD4AF78) : Colors.grey[400],
              fontSize: 11,
              fontFamily: 'Kanit',
            ),
          ),
        ],
      ),
    );
  }
  
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF2C2C2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kanit',
          ),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: TextStyle(
            color: Colors.grey[300],
            fontFamily: 'Kanit',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey[400],
                fontFamily: 'Kanit',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/signin', (route) => false);
            },
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontFamily: 'Kanit',
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF2C2C2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Delete Account',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kanit',
          ),
        ),
        content: Text(
          'Are you sure you want to delete your account? This action cannot be undone.',
          style: TextStyle(
            color: Colors.grey[300],
            fontFamily: 'Kanit',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey[400],
                fontFamily: 'Kanit',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Add delete account logic here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Account deletion requested',
                    style: TextStyle(fontFamily: 'Kanit'),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontFamily: 'Kanit',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
