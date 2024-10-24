import 'package:flutter/material.dart';
import 'package:flutter_login/login_page.dart';
import 'package:flutter_login/models/data_user.dart';
import 'package:flutter_login/models/model_user.dart';
import 'package:flutter_login/welcome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool passToggle = true;

  List<Map<String, String>> penggunaterdaftar = [];

  String? validasiEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? validasiPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      String inputEmail = email.text;
      String inputPassword = password.text;
      User? pengguna = UserData.loginUser(inputEmail, inputPassword);

      if (pengguna != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Welcome(nama: pengguna.name),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email atau password salah')),
        );
      }
    }
  }

  void registrasi() async {
    final newUser = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );

    if (newUser != null && newUser is Map<String, String>) {
      setState(() {
        penggunaterdaftar.add(newUser);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: validasiEmail,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: password,
                        obscureText: passToggle,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(
                                () {
                                  passToggle = !passToggle;
                                },
                              );
                            },
                            child: Icon(passToggle
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        validator: validasiPassword,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: login,
                        child: Text('Login'),
                      ),
                      TextButton(
                        onPressed: registrasi,
                        child: Text('Daftar'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
