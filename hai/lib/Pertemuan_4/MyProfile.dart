import 'package:flutter/material.dart';
import 'package:hai/Pertemuan_4/MyNav.dart';
import 'package:hai/main.dart';
import 'package:hai/tugas2.dart';

void main() => runApp(const MyProfile(id: null,, name: '',));

class MyProfile extends StatelessWidget{
  final int id;
  final String name;
  const MyProfile({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: $id'),
            Text('Name: $name'),
          ],
        ),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed:(){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const MyProfile(id: 1, name: 'Galid'),
             ),
            );
          }, child:Text('Profile'),
        ),
      ),
    );
  }
}




