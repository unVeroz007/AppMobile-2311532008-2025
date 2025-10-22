import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Kursus'),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Header
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    product.image,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Course Title
            Text(
              product.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // Instructor
            Row(
              children: [
                Icon(Icons.person, color: Colors.grey, size: 16),
                SizedBox(width: 4),
                Text(
                  'Instruktur: ${product.instructor}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Rating and Students
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text(
                  product.rating.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                Icon(Icons.people, color: Colors.grey, size: 20),
                SizedBox(width: 4),
                Text('${product.students} Siswa'),
                Spacer(),
                Text(
                  'Rp ${product.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Description
            Text(
              'Deskripsi Kursus',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),

            // Course Features
            Text(
              'Yang akan didapatkan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            _buildFeatureItem('✓ Video pembelajaran lengkap'),
            _buildFeatureItem('✓ Source code dan materi'),
            _buildFeatureItem('✓ Sertifikat penyelesaian'),
            _buildFeatureItem('✓ Forum diskusi dengan instruktur'),
            _buildFeatureItem('✓ Akses 1 tahun'),
            SizedBox(height: 32),

            // Enroll Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _showEnrollDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'ENROLL SEKARANG',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _showEnrollDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Berhasil Enroll!'),
        content: Text('Anda telah berhasil enroll ke kursus "${product.name}"'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}