import 'package:flutter/material.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Profil Saya"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueAccent, width: 2),
              ),
              child: Column(
                children: [
                  // FOTO PROFIL
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/profil.jpg'),
                  ),
                  const SizedBox(height: 20),

                  // NAMA
                  const Text(
                    "Nama : Muhammad Galid Avero",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 10),

                  // NIM
                  const Text(
                    "NIM : 2311532008",
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 10),

                  // JURUSAN
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.school, color: Colors.blueAccent),
                      SizedBox(width: 8),
                      Text(
                        "Jurusan : Informatika",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  // ALAMAT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.home, color: Colors.blueAccent),
                      SizedBox(width: 8),
                      Text(
                        "Alamat : Gunung Pangilun, Kota Padang, Indonesia",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  //NO HP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.phone, color: Colors.blueAccent),
                      SizedBox(width: 8),
                      Text(
                        "No HP : 082386123456",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // EMAIL
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.email, color: Colors.blueAccent),
                      SizedBox(width: 8),
                      Text(
                        "Email : mgalidavero05@gmail.com",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  const Text(
                    "Logo Universitas",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Logo_Unand.svg/600px-Logo_Unand.svg.png",
                    width: 120,
                    height: 120,
                  ),

                  const SizedBox(height: 20),

                  // ELEVATED BUTTON
                  ElevatedButton.icon(
                    onPressed: () {
                      // aksi sederhana
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Profil anda diklik!")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.info),
                    label: const Text("Lihat Detail"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
