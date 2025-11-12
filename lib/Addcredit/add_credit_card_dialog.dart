import 'credit_card_tooltip.dart';
import 'expiry_date_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'card_number_input_formatter.dart';

class AddCreditCardDialog extends StatefulWidget {
  final void Function(Map<String, String> card) onAdd;
  const AddCreditCardDialog({Key? key, required this.onAdd}) : super(key: key);

  @override
  State<AddCreditCardDialog> createState() => _AddCreditCardDialogState();
}

class _AddCreditCardDialogState extends State<AddCreditCardDialog> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  bool isDefault = false;

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    cardHolderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF23211E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Info bar
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF5E6C8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.shield, color: Color(0xFF23211E), size: 18),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Card information is kept secret.',
                        style: TextStyle(
                          color: Color(0xFF23211E),
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
                        Icon(Icons.radio_button_checked, size: 18, color: Color(0xFFD4AF78)),
                        const SizedBox(width: 2),
                        const Text('VISA', style: TextStyle(color: Colors.white, fontFamily: 'Kanit', fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Text('Card Number', style: TextStyle(color: Colors.white, fontFamily: 'Kanit', fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      maxLength: 19,
                      inputFormatters: [CardNumberInputFormatter()],
                      style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                      decoration: InputDecoration(
                        hintText: '1234 1234 1234 1234',
                        counterText: '',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Expire date', style: TextStyle(color: Colors.white, fontFamily: 'Kanit', fontWeight: FontWeight.w600)),
                              const SizedBox(height: 6),
                              TextField(
                                controller: expiryController,
                                keyboardType: TextInputType.number,
                                maxLength: 5,
                                inputFormatters: [ExpiryDateInputFormatter()],
                                style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                                decoration: InputDecoration(
                                  hintText: 'MM/YY',
                                  counterText: '',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('CVV Code', style: TextStyle(color: Colors.white, fontFamily: 'Kanit', fontWeight: FontWeight.w600)),
                                  const SizedBox(width: 4),
                                  Builder(
                                    builder: (context) {
                                      final iconKey = GlobalKey();
                                      return GestureDetector(
                                        onTap: () {
                                          final overlay = Overlay.of(context);
                                          late OverlayEntry entry;
                                          final box = iconKey.currentContext?.findRenderObject() as RenderBox?;
                                          final offset = box?.localToGlobal(Offset.zero) ?? Offset.zero;
                                          bool closed = false;
                                          void removeEntry() {
                                            if (!closed && entry.mounted) {
                                              closed = true;
                                              entry.remove();
                                            }
                                          }
                                          entry = OverlayEntry(
                                            builder: (context) => Positioned(
                                              left: offset.dx + (box?.size.width ?? 0) / 2 - 100,
                                              top: offset.dy - 68,
                                              child: CVVTooltipBubble(onClose: removeEntry),
                                            ),
                                          );
                                          overlay.insert(entry);
                                          Future.delayed(const Duration(milliseconds: 1500), removeEntry);
                                        },
                                        child: Container(
                                          key: iconKey,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white38,
                                              width: 1.2,
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.info_outline,
                                            color: Colors.white38,
                                            size: 18,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              TextField(
                                controller: cvvController,
                                keyboardType: TextInputType.number,
                                maxLength: 3,
                                style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                                decoration: InputDecoration(
                                  hintText: '123',
                                  counterText: '',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text('Cardholder Name', style: TextStyle(color: Colors.white, fontFamily: 'Kanit', fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: cardHolderController,
                      style: const TextStyle(color: Colors.black, fontFamily: 'Kanit'),
                      decoration: InputDecoration(
                        hintText: 'Enter your name on the card',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                        const Text('Set as default payment method', style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Kanit')),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (cardNumberController.text.isEmpty ||
                                  expiryController.text.isEmpty ||
                                  cvvController.text.isEmpty ||
                                  cardHolderController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Please fill all fields.')),
                                );
                                return;
                              }
                              widget.onAdd({
                                'number': cardNumberController.text,
                                'expiry': expiryController.text,
                                'cvv': cvvController.text,
                                'holder': cardHolderController.text,
                                'isDefault': isDefault.toString(),
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
