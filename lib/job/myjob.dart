import 'package:flutter/material.dart';
import 'jobdetail.dart';
import '../widgets/MenuDrawer.dart';

class MyJobPage extends StatefulWidget {
  @override
  State<MyJobPage> createState() => _MyJobPageState();
}

class _MyJobPageState extends State<MyJobPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      endDrawer: MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF181818),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Job',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kanit',
          ),
        ),
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
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Container(
            color: Color(0xFF232323),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Color(0xFFF3C892),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              labelStyle: TextStyle(
                fontFamily: 'Kanit',
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(text: 'Current Jobs'),
                Tab(text: 'Job History'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildJobList(context, true), _buildJobList(context, false)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF232323),
        selectedItemColor: Color(0xFFF3C892),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/welcome');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/chat');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/favorite');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'image/chat.png',
              width: 24,
              height: 24,
              color: Colors.white,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'myJob',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24.0, right: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SquareImageButton(
              imagePath: 'image/chat.png',
              bgColor: Color(0xFFF3E2B7),
              onTap: () {},
            ),
            SizedBox(height: 12),
            SquareImageButton(
              imagePath: 'image/line.png',
              bgColor: Color(0xFFF3E2B7),
              onTap: () {},
            ),
            SizedBox(height: 12),
            SquareImageButton(
              imagePath: 'image/live-chat.png',
              bgColor: Color(0xFFF3E2B7),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobList(BuildContext context, bool isCurrent) {
    if (isCurrent) {
      // Current Jobs - 2 items
      return ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildJobCard(
            title: 'Entertain',
            name: 'Nay X',
            date: '20/10/2025',
            code: 'WRD',
            price: '฿ 4,000',
            checkIn: '10:00 น.',
            checkOut: '14:00 น.',
            status: 'กำลังทำงาน',
            statusColor: Colors.green,
            statusBg: Colors.transparent,
            tag: 'งานปัจจุบัน',
            tagColor: Colors.white,
          ),
          SizedBox(height: 12),
          _buildJobCard(
            title: 'Entertain',
            name: 'Nay X',
            date: '20/10/2025',
            code: 'WRD',
            price: '฿ 4,000',
            checkIn: '15:00 น.',
            checkOut: '19:00 น.',
            status: 'รอชำระ',
            statusColor: Color(0xFFF3C892),
            statusBg: Color(0xFFF3E2B7),
            tag: 'งานรอชำระ',
            tagColor: Colors.white,
          ),
        ],
      );
    } else {
      // Job History - 3 items
      return ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildJobCard(
            title: 'Entertain',
            name: 'Nay X',
            date: '20/10/2025',
            code: 'WRD',
            price: '฿ 4,000',
            checkIn: '05:00 น.',
            checkOut: '09:00 น.',
            status: 'สำเร็จสิ้น',
            statusColor: Colors.green,
            statusBg: Colors.transparent,
            tag: 'สำเร็จสิ้น',
            tagColor: Colors.green,
          ),
          SizedBox(height: 12),
          _buildJobCard(
            title: 'Entertain',
            name: 'Nay X',
            date: '20/10/2025',
            code: 'WRD',
            price: '฿ 4,000',
            checkIn: '10:00 น.',
            checkOut: '14:00 น.',
            status: 'ยังไม่ชำระ',
            statusColor: Color(0xFFF3C892),
            statusBg: Color(0xFFF3E2B7),
            tag: 'ยังไม่ชำระ',
            tagColor: Color(0xFFF3C892),
          ),
          SizedBox(height: 12),
          _buildJobCard(
            title: 'Entertain',
            name: 'Nay X',
            date: '20/10/2025',
            code: 'WRD',
            price: '฿ 4,000',
            checkIn: '00:00 น.',
            checkOut: '04:00 น.',
            status: 'ยกเลิกแล้ว',
            statusColor: Colors.red,
            statusBg: Colors.transparent,
            tag: 'ยกเลิกแล้ว',
            tagColor: Colors.red,
          ),
        ],
      );
    }
  }

  Widget _buildJobCard({
    required String title,
    required String name,
    required String date,
    required String code,
    required String price,
    required String checkIn,
    required String checkOut,
    required String status,
    required Color statusColor,
    required Color statusBg,
    required String tag,
    required Color tagColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Job details (title, name, date, code, price)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Kanit',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Kanit',
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontFamily: 'Kanit',
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  code,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontFamily: 'Kanit',
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Kanit',
                  ),
                ),
              ],
            ),
          ),
          // Right side: Status, Check in/out times, and Details button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Status with icon
              Row(
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: 'Kanit',
                    ),
                  ),
                  SizedBox(width: 4),
                  if (statusColor == Colors.green)
                    Icon(Icons.circle, color: Colors.green, size: 10)
                  else if (statusColor == Color(0xFFF3C892))
                    Icon(Icons.circle, color: Color(0xFFF3C892), size: 10)
                  else if (statusColor == Colors.red)
                    Icon(Icons.circle, color: Colors.red, size: 10),
                ],
              ),
              SizedBox(height: 8),
              // Check in time
              Row(
                children: [
                  Text(
                    'Check in ',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontFamily: 'Kanit',
                    ),
                  ),
                  Text(
                    checkIn,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              // Check out time
              Row(
                children: [
                  Text(
                    'Check Out ',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontFamily: 'Kanit',
                    ),
                  ),
                  Text(
                    checkOut,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              // Details button
              GestureDetector(
                onTap: () {
                  _showJobDetailsDialog(
                    context: context,
                    title: title,
                    name: name,
                    date: date,
                    code: code,
                    price: price,
                    checkIn: checkIn,
                    checkOut: checkOut,
                    status: status,
                    statusColor: statusColor,
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'รายละเอียด',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showJobDetailsDialog({
    required BuildContext context,
    required String title,
    required String name,
    required String date,
    required String code,
    required String price,
    required String checkIn,
    required String checkOut,
    required String status,
    required Color statusColor,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JobDetailPage(
          title: title,
          name: name,
          date: date,
          code: code,
          price: price,
          checkIn: checkIn,
          checkOut: checkOut,
          status: status,
          statusColor: statusColor,
        ),
      ),
    );
  }
}

// --- Place this at the very end of the file, outside any other class ---
class SquareImageButton extends StatelessWidget {
  final String imagePath;
  final Color bgColor;
  final VoidCallback onTap;
  const SquareImageButton({
    Key? key,
    required this.imagePath,
    required this.bgColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 28,
            height: 28,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

// Old SquareIconButton (kept for reference, can be removed)
class SquareIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback onTap;
  const SquareIconButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, color: iconColor, size: 28),
        ),
      ),
    );
  }
}
