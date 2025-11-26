import 'package:flutter/material.dart';

// Import semua halaman praktikum
import 'list_view_page.dart';
import 'grid_view_page.dart';
import 'list_tile_page.dart';
import 'single_scroll.dart';
import 'scroll_horizontal.dart';
import 'scroll_custom.dart';
import 'image_page.dart';
import 'cache_image_page.dart';
import 'icon_page.dart';
import 'svg_images.dart';
import 'loading_error_page.dart';
import 'contact_list_page.dart'; 
import 'gallery_page.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modul 7: Home')),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          // --- Halaman Latihan dari Modul ---
          _buildMenuItem(context, 'ListView Page', const ListViewPage()),
          _buildMenuItem(context, 'GridView Page', const GridViewPage()),
          _buildMenuItem(context, 'ListTile Page', const ListTilePage()),
          _buildMenuItem(context, 'Single Scroll', const SingleScroll()),
          _buildMenuItem(
            context,
            'Horizontal Scroll',
            const ScrollHorizontal(),
          ),
          _buildMenuItem(context, 'Custom Scroll', const ScrollCustom()),
          _buildMenuItem(context, 'Image Page', const ImagePage()),
          _buildMenuItem(context, 'Cache Image Page', const CacheImagePage()),
          _buildMenuItem(context, 'Icon Page', const IconPage()),
          _buildMenuItem(context, 'SVG Image Page', const SvgImage()),
          _buildMenuItem(
            context,
            'Loading/Error Page',
            const LoadingErrorPage(),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Divider(thickness: 2),
          ),

          _buildMenuItem(
            context,
            'Tugas: Daftar Kontak',
            const ContactListPage(), 
          ),
          _buildMenuItem(
            context,
            'Tugas: Galeri Sederhana',
            const GalleryPage(), 
          ),
        ],
      ),
    );
  }

  // Helper widget untuk membuat menu
  Widget _buildMenuItem(BuildContext context, String title, Widget page) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
