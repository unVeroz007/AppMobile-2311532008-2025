import 'package:flutter/material.dart';

void main(){
  runApp(const MyElevatedButton());
}

class MyElevatedButton extends StatefulWidget {
  const MyElevatedButton({super.key});

  @override
  State<MyElevatedButton> createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton>{
  @override
  Widget build(BuildContext context){
    return MaterialApp( 
      home: Scaffold(
        appBar: AppBar(title: const Text("Elevated Button")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              print("tombol ditekan");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            foregroundColor: Colors.white, 
            padding: const EdgeInsets.all(20), 
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: const Text("Elevated Button"),
          ),
        ),  
      ),
  );
  }
}