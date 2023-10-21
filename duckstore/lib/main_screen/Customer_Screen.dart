import 'package:duckstore/main_screen/Cart_Screen.dart';
import 'package:duckstore/main_screen/Category.dart';
import 'package:duckstore/main_screen/HomeScreen.dart';
import 'package:duckstore/main_screen/Profile.dart';
import 'package:duckstore/main_screen/Stores_file.dart';
import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:flutter/material.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tab = const [
    HomeScreen(),
    CategoryScreen(),
    StoresBar(),
    CartScreen(back: AppBarB(),),
    ProfileScreen(),
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
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
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
