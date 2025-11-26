import 'package:flutter/material.dart';

class ScrollCustom extends StatelessWidget {
  const ScrollCustom({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(title: Text('ScrollingDemo')),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Daftar Item#$index')),
              childCount: 10,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.purple[100 * ((index % 8) + 1)],
                child: Center(child: Text('Grid $index')),
              ),
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
