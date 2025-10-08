import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Tugas Navigation & Routing',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(), // route '/' mengarah ke halaman Login
        '/home': (context) => const HomePage(), // route '/home' mengarah ke halaman utama
      },
    );
  }
}

//HALAMAN LOGIN 
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller digunakan untuk mengambil teks dari TextField
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            // Input field untuk username
            TextField(
              controller: _usernameController, // menghubungkan controller
              decoration: const InputDecoration(labelText: 'Username'),
            ),

            const SizedBox(height: 15), 
            // Input field untuk password
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true, // agar teks password tidak terlihat
            ),

            const SizedBox(height: 20),

            // Tombol login
            ElevatedButton(
              onPressed: () {
                // Ambil data dari TextField
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Pindah ke halaman Home sambil mengirim data username dan password
                Navigator.pushNamed(
                  context,
                  '/home', // nama route tujuan
                  arguments: {
                    'username': username,
                    'password': password,
                  }, // data dikirim dalam bentuk Map
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

//HALAMAN HOME
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menerima data dari halaman Login menggunakan ModalRoute
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    // Jika data ada, ambil nilai username dan password
    final username = args?['username'] ?? 'Unknown';
    final password = args?['password'] ?? 'Not set';

    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan data yang dikirim dari halaman Login
            Text(
              'Selamat Datang, $username!',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Password Anda: $password'),
            const SizedBox(height: 30),
            const Text(
              'Contoh Navigasi Menggunakan Bottom Navigation Bar:',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION BAR 
      // Salah satu contoh konsep navigation & routing bawaan Flutter
      bottomNavigationBar: BottomNavigationBar(
        // Daftar menu yang muncul di bawah layar
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],

        // Aksi ketika salah satu menu ditekan
        onTap: (index) {
          if (index == 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Menu Home ditekan')),
            );
          } else if (index == 1) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Menu Profile ditekan')),
            );
          } else if (index == 2) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Menu Settings ditekan')),
            );
          }
        },
      ),
    );
  }
}
