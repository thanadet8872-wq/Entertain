import 'package:flutter/material.dart';

class UpgradePlan extends StatefulWidget {
  const UpgradePlan({super.key});

  @override
  State<UpgradePlan> createState() => _UpgradePlanState();
}

class _UpgradePlanState extends State<UpgradePlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1E),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Our Plan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Kanit',
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16, top: 8, bottom: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFD4AF78),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'VIP',
                style: TextStyle(
                  color: Color(0xFF2C2C2E),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit',
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            
            // Plan comparison table
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // Header row
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: Text(
                              'Free',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xFF3A3A3C),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFD4AF78),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'VIP',
                                style: TextStyle(
                                  color: Color(0xFF2C2C2E),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  Divider(color: Color(0xFF3A3A3C), height: 1),
                  
                  // Feature rows
                  _buildFeatureRow('Choose a pretty', true, true),
                  _buildFeatureRow('Chat with pretty', true, true),
                  _buildFeatureRow('Voice call with pretty', false, true),
                  _buildFeatureRow('Video call with pretty', false, true),
                  _buildFeatureRow('Booking with pretty', true, true),
                  _buildFeatureRow('Unlimited Favorite', false, true, isLast: true),
                ],
              ),
            ),
            
            SizedBox(height: 24),
            
            // Upgrade Plan Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle upgrade
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Upgrade to VIP Plan'),
                      backgroundColor: Color(0xFFD4AF78),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE8D4B8),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Upgrad Plan',
                  style: TextStyle(
                    color: Color(0xFF3C3C3C),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit',
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
  
  Widget _buildFeatureRow(String feature, bool hasFree, bool hasVIP, {bool isLast = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast ? BorderSide.none : BorderSide(color: Color(0xFF3A3A3C), width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Text(
                feature,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Kanit',
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Center(
                child: hasFree
                    ? Icon(Icons.check, color: Colors.white, size: 20)
                    : SizedBox.shrink(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: Color(0xFF3A3A3C),
                borderRadius: isLast ? BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ) : BorderRadius.zero,
              ),
              child: Center(
                child: hasVIP
                    ? Icon(Icons.check, color: Colors.white, size: 20)
                    : SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
