import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFB29B6E),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 50),
          _buildDrawerItem(
            context,
            icon: Icons.person_outline,
            title: 'My Profile',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profile');
            },
          ),
          Divider(color: Colors.white54, height: 1),
          _buildDrawerItem(
            context,
            icon: Icons.language,
            title: 'Change Language',
            onTap: () {
              Navigator.pop(context);
              // Add language change functionality
            },
          ),
          Divider(color: Colors.white54, height: 1),
          _buildDrawerItem(
            context,
            icon: Icons.star_outline,
            title: 'Review',
            onTap: () {
              Navigator.pop(context);
              // Add review functionality
            },
          ),
          Divider(color: Colors.white54, height: 1),
          _buildDrawerItem(
            context,
            icon: Icons.payment,
            title: 'Payment',
            onTap: () {
              Navigator.pop(context);
              // Add payment functionality
            },
          ),
          Divider(color: Colors.white54, height: 1),
          _buildDrawerItem(
            context,
            icon: Icons.settings_outlined,
            title: 'Setting',
            onTap: () {
              Navigator.pop(context);
              // Add settings functionality
            },
          ),
          Divider(color: Colors.white54, height: 1),
          _buildDrawerItem(
            context,
            icon: Icons.logout,
            title: 'Log out',
            onTap: () {
              Navigator.pop(context);
              // Add logout functionality
              Navigator.pushNamedAndRemoveUntil(context, '/signin', (route) => false);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 24),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    );
  }
}
