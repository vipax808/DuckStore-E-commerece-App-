import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:flutter/material.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          subcategName: 'ManageProducts',

        ),
        
      ),
    );
  }
}
