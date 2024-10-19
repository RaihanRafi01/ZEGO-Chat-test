import 'package:flutter/material.dart';
import 'package:zego_chat_test/screens/chat.dart';
import 'package:zego_zimkit/zego_zimkit.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController userIDController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  LoginScreen({super.key});

  Future<void> loginUser(BuildContext context) async {
    final userID = userIDController.text;
    final userName = userNameController.text;

    await ZIMKit().connectUser(id: userID, name: userName);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ZIMKitDemoHomePage())
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userIDController,
              decoration: InputDecoration(labelText: 'User ID'),
            ),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(labelText: 'User Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => loginUser(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}