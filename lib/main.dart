import 'package:flutter/material.dart';
import 'Getstarted/get started.dart';
import 'Getstarted/Welcome.dart';
import 'chat/Chat.dart';
import 'screens/Notification.dart';
import 'Profile/Profilepertty1.dart';
import 'Profile/ProfileEmployer.dart';
import 'Profile/UpgradePlan.dart';
import 'Profile/payment.dart';
import 'job/myjob.dart';
import 'job/cancelJob.dart';
import 'Addcredit/credit_card.dart';
import 'My_wallet/my_wallet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entertain',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GetStartedScreen(), // เริ่มต้นที่หน้า Get Started
      debugShowCheckedModeBanner: false,
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/chat': (context) => ChatScreen(),
        '/notification': (context) => NotificationScreen(),
        '/profile': (context) => ProfileEmployer(),
        '/profilepretty': (context) => Profilepertty1(),
        '/upgrade': (context) => UpgradePlan(),
        '/payment': (context) => PaymentPage(),
        '/creditcard': (context) => CreditCardPage(),
        '/home': (context) => HomeScreen(),
        '/myjob': (context) => MyJobPage(),
        '/favorite': (context) => FavoriteScreen(),
        '/wallet': (context) => MyWalletPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/job_cancelled') {
          final args = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(
            builder: (context) => CancelJobPage(
              title: args?['title'] ?? 'งานเปิิดตัวบูชเครื่องสำหรับ',
              name: args?['name'] ?? 'Alena Brown',
              date: args?['date'] ?? '10 Oct 2025',
              checkIn: args?['checkIn'] ?? '10:00',
              checkOut: args?['checkOut'] ?? '18:00',
              status: args?['status'] ?? 'Cancelled',
              statusColor: args?['statusColor'] ?? Color(0xFFFF0000),
            ),
          );
        }
        return null;
      },
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF1A1A1A),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home Screen',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/wallet');
              },
              child: Text('ไปหน้า My Wallet'),
            ),
          ],
        ),
      ),
    );
  }
}

// My Job Screen
// class MyJobScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('My Job'),
//         backgroundColor: Color(0xFF1A1A1A),
//       ),
//       body: Center(
//         child: Text(
//           'My Job Screen',
//           style: TextStyle(color: Colors.white, fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

// Favorite Screen
class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Favorite'),
        backgroundColor: Color(0xFF1A1A1A),
      ),
      body: Center(
        child: Text(
          'Favorite Screen',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

