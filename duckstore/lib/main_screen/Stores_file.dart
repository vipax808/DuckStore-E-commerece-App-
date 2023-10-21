import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:flutter/material.dart';

class StoresBar extends StatelessWidget {
  const StoresBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: AppBarTitle(subcategName: 'Stores'),
      ),
    );
  }
}
