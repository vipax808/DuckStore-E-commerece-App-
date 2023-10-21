import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:flutter/material.dart';

class SuppStatics extends StatelessWidget {
  const SuppStatics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          subcategName: 'SuppStatics',

        ),
        
      ),
    );
  }
}
