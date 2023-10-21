import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:flutter/material.dart';

class EditBusiness extends StatelessWidget {
  const EditBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          subcategName: 'EditBusiness',

        ),
        
      ),
    );
  }
}
