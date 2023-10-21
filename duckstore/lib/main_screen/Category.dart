import 'package:duckstore/category/Accessories_category.dart';
import 'package:duckstore/category/Bags_category.dart';
import 'package:duckstore/category/Electronics.category.dart';
import 'package:duckstore/category/Kids_category.dart';
import 'package:duckstore/category/beauty_category.dart';
import 'package:duckstore/category/home&garden_category.dart';
import 'package:duckstore/category/men_category.dart';
import 'package:duckstore/category/shoes_category.dart';
import 'package:duckstore/category/women_category.dart';
import 'package:duckstore/main_screen/HomeScreen.dart';
import 'package:flutter/material.dart';

List<ItemData> item = [
  ItemData(label: 'men'),
  ItemData(label: 'women'),
  ItemData(label: 'shoes'),
  ItemData(label: 'bags'),
  ItemData(label: 'electronics'),
  ItemData(label: 'accessories'),
  ItemData(label: 'home & garden'),
  ItemData(label: 'kids'),
  ItemData(label: 'beauty'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    for (var element in item) {
      element.isSelected = false;
    }
    setState(() {
      item[0].isSelected = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: sideNavigator(size)),
          Positioned(bottom: 0, right: 0, child: categView(size)),
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceInOut);
            },
            child: Container(
              color: item[index].isSelected == true
                  ? Colors.white
                  : Colors.grey.shade300,
              height: 100,
              child: Center(child: Text(item[index].label)),
            ),
          );
        },
      ),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          for (var element in item) {
            element.isSelected = false;
          }
          setState(() {
            item[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: [
          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          HomeAndGardenCategory(),
          KidsCategory(),
          BeautyCategory()
        ],
      ),
    );
  }
}

class ItemData {
  bool isSelected;
  String label;
  ItemData({required this.label, this.isSelected = false});
}
