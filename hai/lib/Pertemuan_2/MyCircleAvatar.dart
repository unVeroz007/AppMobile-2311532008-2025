import 'package:flutter/material.dart';

void main() {
  runApp(const MyCircleAvatar());
}

class MyCircleAvatar extends StatefulWidget {
  const MyCircleAvatar({super.key});

  @override
  State<MyCircleAvatar> createState() => _MyCircleAvatarState();
}

class _MyCircleAvatarState extends State<MyCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Icon widget")),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                child: Text(
                  "IF",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
