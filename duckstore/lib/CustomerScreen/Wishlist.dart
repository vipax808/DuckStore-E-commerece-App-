import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          subcategName: 'wishlist',
        ),
      ),
    );
  }
}
