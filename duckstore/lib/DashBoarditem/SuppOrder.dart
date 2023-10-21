import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:flutter/material.dart';

class SuppOrders extends StatelessWidget {
  const SuppOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          subcategName: 'SuppOrder',

        ),
        
      ),
    );
  }
}
