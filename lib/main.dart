import 'package:flutter/material.dart';
import 'get started.dart';
import 'Welcome.dart';
import 'Chat.dart';
import 'Notification.dart';

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
      },
    );
  }
}

