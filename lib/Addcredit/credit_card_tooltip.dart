import 'package:flutter/material.dart';

class CVVTooltipBubble extends StatelessWidget {
  final VoidCallback onClose;
  const CVVTooltipBubble({required this.onClose, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFFF5E6C8),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Card Verification Value',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Kanit',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: onClose,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Icon(Icons.close, size: 18, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CustomPaint(
              painter: _TooltipPointerPainter(),
              child: SizedBox(width: 24, height: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class _TooltipPointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFF5E6C8)
      ..style = PaintingStyle.fill;
    final path = Path();
    path.moveTo(size.width / 2 - 8, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width / 2 + 8, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
