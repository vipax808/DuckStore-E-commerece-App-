
import 'package:flutter/material.dart';
import 'package:duckstore/main_screen/Category.dart';
import 'package:duckstore/main_screen/Dashboard.dart';
import 'package:duckstore/main_screen/HomeScreen.dart';
import 'package:duckstore/main_screen/Stores_file.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({Key? key}) : super(key: key);

  @override
  State<SupplierScreen> createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  int _selectedIndex = 0;
  List <Widget> _tab = [
    HomeScreen(),
    CategoryScreen(),
    StoresBar(),
    Dashboard(),
    Center(
      child: Text('upload'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tab[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
