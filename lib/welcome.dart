import 'package:flutter/material.dart';
import 'package:flutter_login/register_page.dart';

class Welcome extends StatelessWidget {
  final String nama;

  const Welcome({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selamat Datang',
          style: TextStyle(fontSize: 40, color: Colors.blue),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school_outlined,
              size: 200,
              color: Colors.blue,
            ),
            Text(
              'selamat Datang',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[600]),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '${nama}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'FLUTTER PEMULA',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                size: 30,
                color: Colors.red[700],
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
