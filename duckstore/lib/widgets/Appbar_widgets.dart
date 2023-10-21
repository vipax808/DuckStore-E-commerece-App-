
import 'package:flutter/material.dart';

class AppBarB extends StatelessWidget {
  const AppBarB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

class AppBarTitle extends StatelessWidget {
  final String subcategName;
  const AppBarTitle({super.key, required this.subcategName});

  @override
  Widget build(BuildContext context) {
    return Text(
      subcategName,
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'Acme',
          fontSize: 28,
          letterSpacing: 1.5),
    );
  }
}
