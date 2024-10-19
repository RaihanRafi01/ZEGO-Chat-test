import 'package:flutter/material.dart';
import 'package:zego_chat_test/screens/login.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
void main() {
  ZIMKit().init(
    appID: 509742954, // your appid
    appSign: 'd345b080c56510035f7d50599f765112e03722c61bdc4400558901f6910636d4', // your appSign
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messaging App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

