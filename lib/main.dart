import 'package:flutter/material.dart';
import 'get started.dart';
import 'Welcome.dart';
import 'Chat.dart';
import 'Notification.dart';
import 'Profilepertty1.dart';
import 'myjob.dart';

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
        '/profile': (context) => Profilepertty1(),
        '/home': (context) => HomeScreen(),
        '/myjob': (context) => MyJobPage(),
        '/favorite': (context) => FavoriteScreen(),
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
        child: Text(
          'Home Screen',
          style: TextStyle(color: Colors.white, fontSize: 24),
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

