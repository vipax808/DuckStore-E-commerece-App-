import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:flutter/material.dart';

class CustomerOrder extends StatelessWidget {
  const CustomerOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          subcategName: 'CustomerOrder',

        ),
        
      ),
    );
  }
}
