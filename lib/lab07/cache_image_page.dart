import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImagePage extends StatelessWidget {
  const CacheImagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cache Image Page')),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/300',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
