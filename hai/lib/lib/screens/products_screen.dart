import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import '../models/product_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  final List<Product> products = const [
    Product(
      id: '1',
      name: 'Flutter Mobile Development',
      description: 'Belajar membuat aplikasi mobile cross-platform dengan Flutter dan Dart. Kursus lengkap dari dasar hingga advanced.',
      price: 299000,
      image: '📱',
      instructor: 'Muhammad Farhan Saputra',
      rating: 4.8,
      students: 1250,
    ),
    Product(
      id: '2',
      name: 'Full-Stack Web Development',
      description: 'Kuasai teknologi web modern dengan React, Node.js, dan MongoDB. Bangun aplikasi web yang scalable.',
      price: 399000,
      image: '💻',
      instructor: 'Muhammad Nugraha Patria',
      rating: 4.7,
      students: 980,
    ),
    Product(
      id: '3',
      name: 'Data Science dengan Python',
      description: 'Pelajari analisis data, machine learning, dan visualisasi data menggunakan Python dan library populer.',
      price: 449000,
      image: '📊',
      instructor: 'Rifki Yuliandra',
      rating: 4.9,
      students: 750,
    ),
    Product(
      id: '4',
      name: 'UI/UX Design Fundamentals',
      description: 'Pelajari prinsip desain, user research, prototyping, dan tools modern untuk menjadi UI/UX Designer.',
      price: 249000,
      image: '🎨',
      instructor: 'Ahmad Fajri Jiebuoy',
      rating: 4.6,
      students: 620,
    ),
    Product(
      id: '5',
      name: 'Cloud Computing AWS',
      description: 'Master layanan AWS dan implementasi cloud computing untuk aplikasi enterprise yang scalable.',
      price: 599000,
      image: '☁️',
      instructor: 'Reynard',
      rating: 4.8,
      students: 430,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    product.image,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              title: Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    'Oleh: ${product.instructor}',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text('${product.rating}'),
                      SizedBox(width: 16),
                      Icon(Icons.people, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text('${product.students}'),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rp ${product.price.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ),
                  ),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}