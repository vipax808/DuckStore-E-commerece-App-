import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:flutter/material.dart';

class SuppBalance extends StatelessWidget {
  const SuppBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          subcategName: 'SuppBalance',

        ),
        
      ),
    );
  }
}
