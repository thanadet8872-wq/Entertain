import 'package:flutter/material.dart';
import '../widgets/MenuDrawer.dart';
import 'Cerdit_card.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();

}

class _CreditCardPageState extends State<CreditCardPage> {


  // Tooltip and related variables removed for simplicity
  List<Map<String, String>> _creditCards = [];

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
          'Credit Card',
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
              icon: Icon(Icons.menu, color: Colors.white, size: 24),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: MenuDrawer(),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Add credit card button
          InkWell(
            onTap: () {
              _showAddCreditCardDialog();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFFD4AF78),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Color(0xFF1C1C1E), size: 20),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Add credit card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: _creditCards.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.credit_card_outlined,
                          color: Colors.grey[600],
                          size: 80,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No credit cards yet',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 16,
                            fontFamily: 'Kanit',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Add your first credit card',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontFamily: 'Kanit',
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _creditCards.length,
                    itemBuilder: (context, index) {
                      final card = _creditCards[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Color(0xFF232325),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              // Remove card brand image to avoid asset error
              leading: null,
                          title: Text(
                            card['name'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          subtitle: Text(
                            card['number'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFD4AF78),
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Color(0xFF232325),
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _creditCards.removeAt(index);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFB14D4D),
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );

}

  // Move these methods inside the _CreditCardPageState class
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
              _buildNavItem(null, 'Chat', false, () {
                Navigator.pushNamed(context, '/chat');
              }, imagePath: 'image/chat.png'),
              _buildNavItem(Icons.work_outline, 'My Job', false, () {
                Navigator.pushNamed(context, '/myjob');
              }),
              _buildNavItem(Icons.favorite_border, 'Favorite', false, () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Favorite page - Coming soon',
                      style: TextStyle(fontFamily: 'Kanit'),
                    ),
                    backgroundColor: Color(0xFFD4AF78),
                  ),
                );
              }),
              _buildNavItem(Icons.person, 'Profile', false, () {
                Navigator.pushNamed(context, '/profile');
              }),
            ],
          ),
        ),
      ),
    );

}

  Widget _buildNavItem(
    IconData? icon,
    String label,
    bool isActive,
    VoidCallback onTap, {
    String? imagePath,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: isActive ? Color(0xFFD4AF78) : Colors.grey[400],
              size: 24,
            )
          else
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                isActive ? Color(0xFFD4AF78) : Colors.grey[400]!,
                BlendMode.srcIn,
              ),
              child: Image.asset(imagePath!, width: 24, height: 24),
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

  void _showAddCreditCardDialog() {

    final cardNumberController = TextEditingController();
    final expiryController = TextEditingController();
    final cvvController = TextEditingController();
    final cardHolderController = TextEditingController();
    bool isDefault = false;
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF23211E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Info bar
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFF5E6C8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF5E6C8),
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(4),
                            child: Icon(Icons.verified_user, color: Color(0xFF7A6846), size: 28), // shield/check icon
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Card information is kept secret.',
                              style: TextStyle(
                                color: Color(0xFF7A6846),
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 18),
                          Row(
                            children: [
                              Text(
                                'Card info',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit',
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 16),
                              Row(
                                children: [
                                  Radio<int>(
                                    value: 0,
                                    groupValue: 0,
                                    onChanged: null,
                                    activeColor: Color(0xFFD4AF78),
                                  ),
                                  Text('VISA', style: TextStyle(color: Colors.white, fontFamily: 'Kanit', fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Card Number',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          SizedBox(height: 4),
                          TextField(
                            controller: cardNumberController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                            decoration: InputDecoration(
                              hintText: '1234 1234 1234 1234',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontFamily: 'Kanit',
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Expire date',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Kanit',
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    TextField(
                                      controller: expiryController,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                                      decoration: InputDecoration(
                                        hintText: 'MM/YY',
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                          fontFamily: 'Kanit',
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'CVV Code',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Kanit',
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(Icons.info_outline, color: Colors.white38, size: 16),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    TextField(
                                      controller: cvvController,
                                      keyboardType: TextInputType.number,
                                      maxLength: 3,
                                      obscureText: true,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Kanit',
                                      ),
                                      decoration: InputDecoration(
                                        hintText: '123',
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                          fontFamily: 'Kanit',
                                        ),
                                        counterText: '',
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Cardholder Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          SizedBox(height: 4),
                          TextField(
                            controller: cardHolderController,
                            style: TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                            decoration: InputDecoration(
                              hintText: 'Enter your name on the card',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontFamily: 'Kanit',
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Switch(
                                value: isDefault,
                                onChanged: (value) {
                                  setState(() {
                                    isDefault = value;
                                  });
                                },
                                activeColor: Color(0xFFD4AF78),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Set as default payment method',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add card logic here
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFF5E6C8),
                                    padding: EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                      color: Color(0xFF23211E),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Kanit',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFD1D1D1),
                                    padding: EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Color(0xFF23211E),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Kanit',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}