import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final String email;

  const Welcome({super.key, required this.email, String? nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Datang'),
        backgroundColor: Colors.amber[400],
      ),
      body: Center(
        child: Text(
          'Selamat datang, $email!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
