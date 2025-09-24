import 'package:flutter/material.dart';

void main() {
  runApp(const Tugas1());
}

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Tugas 1 Praktikum 2 App Mobile")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Vertikal",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueAccent,
                child: Text(
                  "MGA",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Tahoma',
                    color: Colors.blueGrey[50],
                  ),
                ),
              ),
              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  print("Tombol ditekan");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text("Elevated Button"),
              ),

              SizedBox(height: 10),
              Image.asset(
                'assets/images/LogoUnand.png',
                width: 100,
                height: 100,
              ),

              SizedBox(height: 10),
              Icon(Icons.flutter_dash, size: 50, color: Colors.blue),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Horizontal",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),

                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      "MGA",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Tahoma',
                        color: Colors.blueGrey[50],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      print("Tombol ditekan");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text("Elevated Button"),
                  ),

                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/LogoUnand.png',
                    width: 100,
                    height: 100,
                  ),

                  SizedBox(height: 10),
                  Icon(Icons.flutter_dash, size: 50, color: Colors.blue),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
