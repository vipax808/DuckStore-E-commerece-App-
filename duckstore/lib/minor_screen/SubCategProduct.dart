import 'package:duckstore/utils/categ_list.dart';
import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:flutter/material.dart';

class SubCategProduct extends StatelessWidget {
  final String subcategName;
  final String maincategName;
  const SubCategProduct(
      {super.key, required this.subcategName, required this.maincategName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: AppBarB(),
          title: AppBarTitle(
            subcategName: subcategName,
          )),
      body: Center(
        child: Text(maincategName),
      ),
    );
  }
}
