import 'package:flutter/material.dart';
import 'add_credit_card_dialog.dart';
import 'completed_dialog.dart';
import '../widgets/MenuDrawer.dart';
import 'package:flutter/services.dart';

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < digits.length && i < 4; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(digits[i]);
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);
      if ((i + 1) % 4 == 0 && i + 1 != digits.length) {
        buffer.write(' ');
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key? key}) : super(key: key);

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {

  void _showAddCompletedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const CompletedDialog(),
    );
  }


  void _showDeleteConfirmationDialog(BuildContext context, VoidCallback onDelete) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Do you want to remove this card from your account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Color(0xFF23211E),
                  ),
                ),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onDelete();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE74C3C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        elevation: 0,
                      ),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        elevation: 0,
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Map<String, String>> _creditCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF23211E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Credit Card', style: TextStyle(color: Colors.white, fontFamily: 'Kanit', fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF23211E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 32, bottom: 8),
            child: InkWell(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) => AddCreditCardDialog(
                    onAdd: (card) {
                      setState(() {
                        _creditCards.add(card);
                      });
                      Future.delayed(const Duration(milliseconds: 100), () {
                        _showAddCompletedDialog();
                      });
                    },
                  ),
                );
              },
              borderRadius: BorderRadius.circular(24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add_circle, color: Color(0xFFD4AF78), size: 22),
                  const SizedBox(width: 8),
                  const Text(
                    'Add credit card',
                    style: TextStyle(
                      color: Color(0xFFD4AF78),
                      fontSize: 16,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Card list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              children: _creditCards.map((card) {
                String cardNumber = card['number'] ?? '';
                String cardHolder = card['holder'] ?? '';
                String type = _detectCardType(cardNumber);
                String masked = _maskCardNumber(cardNumber);
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF232325),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Logo
                        type == 'mastercard'
                            ? Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5E6C8),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          left: 0,
                                          child: Container(
                                            width: 14,
                                            height: 14,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFE74C3C),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: Container(
                                            width: 14,
                                            height: 14,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFF5C242),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 3,
                                          child: Container(
                                            width: 14,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF59B23).withOpacity(0.7),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : type == 'visa'
                                ? Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text('VISA', style: TextStyle(color: Color(0xFF23211E), fontWeight: FontWeight.bold, fontFamily: 'Kanit', fontSize: 15)),
                                  )
                                : Container(width: 38, height: 38),
                        const SizedBox(width: 12),
                        // Name & number
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cardHolder,
                                style: const TextStyle(
                                  color: Color(0xFFF5E6C8),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit',
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                masked,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Kanit',
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 54,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              _showEditCreditCardDialog(card, _creditCards.indexOf(card));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF5E6C8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                            ),
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                color: Color(0xFF23211E),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        SizedBox(
                          width: 54,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              _showDeleteConfirmationDialog(context, () {
                                setState(() {
                                  _creditCards.remove(card);
                                });
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE74C3C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                            ),
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Kanit',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF23211E),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
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
              _buildNavItem(Icons.person, 'Profile', true, () {
                Navigator.pushNamed(context, '/profile');
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    bool isChat = label == 'Chat';
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isChat
                  ? Image.asset(
                      'image/chat.png',
                      width: 26,
                      height: 26,
                      color: isActive ? Color(0xFFD4AF78) : Colors.white,
                    )
                  : Icon(
                      icon,
                      color: isActive ? Color(0xFFD4AF78) : Colors.white,
                      size: 26,
                    ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  color: isActive ? Color(0xFFD4AF78) : Colors.white,
                  fontSize: 12,
                  fontFamily: 'Kanit',
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // --- Edit Credit Card Dialog ---
  void _showEditCreditCardDialog(Map<String, String> card, int index) {
    final cardNumberController = TextEditingController(
      text: card['number'] ?? '',
    );
    final expiryController = TextEditingController(text: card['expiry'] ?? '');
    final cvvController = TextEditingController(text: card['cvv'] ?? '');
    final cardHolderController = TextEditingController(
      text: card['holder'] ?? '',
    );
    bool isDefault = card['isDefault'] == 'true';
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF232325),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // AppBar
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF232325),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Expanded(
                          child: Text(
                            'Edit Credit Card',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kanit',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 40), // for symmetry
                      ],
                    ),
                  ),
                  // Card info box
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF232325),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Card info',
                                  style: TextStyle(
                                    color: Color(0xFFF5E6C8),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kanit',
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Icon(
                                  Icons.radio_button_checked,
                                  size: 18,
                                  color: Color(0xFFD4AF78),
                                ),
                                const SizedBox(width: 2),
                                const Text(
                                  'VISA',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            const Text(
                              'Card Number',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextField(
                              controller: cardNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [CardNumberInputFormatter()],
                              maxLength: 19,
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Kanit',
                              ),
                              decoration: InputDecoration(
                                hintText: '1234 1234 1234 1234',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Kanit',
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                counterText: '',
                              ),
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Expire date',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Kanit',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      TextField(
                                        controller: expiryController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          ExpiryDateInputFormatter(),
                                        ],
                                        maxLength: 5,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Kanit',
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'MM/YY',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Kanit',
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 14,
                                              ),
                                          counterText: '',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'CVV Code',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Kanit',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Icon(
                                            Icons.info_outline,
                                            color: Colors.white38,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      TextField(
                                        controller: cvvController,
                                        keyboardType: TextInputType.number,
                                        maxLength: 3,
                                        obscureText: true,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Kanit',
                                        ),
                                        decoration: InputDecoration(
                                          hintText: '123',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'Kanit',
                                          ),
                                          counterText: '',
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
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
                            const SizedBox(height: 14),
                            const Text(
                              'Cardholder Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            TextField(
                              controller: cardHolderController,
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Kanit',
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter your name on the card',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Kanit',
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Switch(
                                  value: isDefault,
                                  onChanged: (value) {
                                    setState(() {
                                      isDefault = value;
                                    });
                                  },
                                  activeColor: const Color(0xFFD4AF78),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Set as default payment method',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Kanit',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Save changes
                              setState(() {
                                _creditCards[index] = {
                                  'number': cardNumberController.text,
                                  'expiry': expiryController.text,
                                  'cvv': cvvController.text,
                                  'holder': cardHolderController.text,
                                  'isDefault': isDefault.toString(),
                                };
                              });
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF5E6C8),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                color: Color(0xFF23211E),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kanit',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD1D1D1),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
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
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper for card type
  String _detectCardType(String number) {
    if (number.startsWith('4')) return 'visa';
    if (number.startsWith('5')) return 'mastercard';
    return 'unknown';
  }

  String _maskCardNumber(String number) {
    if (number.length < 4) return number;
    String last4 = number.substring(number.length - 4);
    return '${number.substring(0, 4)} XXXX XXXX $last4';
  }
}
