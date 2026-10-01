import 'package:flutter/material.dart';

import 'list_page.dart'; // Import halaman tujuan

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controller untuk TextField email dan password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // variabel untuk menandai apakah login gagal atau tidak
  bool _isLoginFailed = false;

  // fungsi untuk menangani login
  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // data dummy untuk login
    if (email == "dhiara" && password == "185") {
      setState(() {
        _isLoginFailed = false;
      });
      // Navigasi ke halaman ListPage dan mengganti halaman login agar tidak bisa kembali ke halaman login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ListPage()),
      );
    } else {
      setState(() {
        _isLoginFailed =
            true; // tandai login gagal agar menampilkan error di TextField
      });
      // Tampilkan notifikasi error di bawah layar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal: Email atau Password salah'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Kuliner',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // TextField Email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Masukkan email',
                  border: const OutlineInputBorder(),
                  errorText: _isLoginFailed ? 'Email/Password salah' : null,
                ),
              ),
              const SizedBox(height: 16),

              // TextField Password
              TextField(
                controller: _passwordController,
                obscureText: true, // agar input password tidak terlihat
                decoration: InputDecoration(
                  hintText: 'Masukkan password',
                  border: const OutlineInputBorder(),
                  errorText: _isLoginFailed ? 'Email/Password salah' : null,
                ),
              ),
              const SizedBox(height: 24),

              // Tombol Login
              ElevatedButton(
                onPressed: _login, // Panggil function saat diklik
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Login', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'models/data.dart';
import 'root.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk ambil input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // State: apakah login gagal
  bool isLoginFailed = false;

  // Fungsi login
  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == user1.username && password == user1.password) {
      // Login berhasil → pindah ke Root
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Root(),
        ),
      );
    } else {
      // Login gagal → set state + snackbar
      setState(() {
        isLoginFailed = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Gagal: Username atau Password salah'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Silakan Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Input Username
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: isLoginFailed ? Colors.red : Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Input Password
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: isLoginFailed ? Colors.red : Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Tombol Login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
