import 'package:duckstore/DashBoarditem/EditBusiness.dart';
import 'package:duckstore/DashBoarditem/ManageProduct.dart';
import 'package:duckstore/DashBoarditem/SuppBalance.dart';
import 'package:duckstore/DashBoarditem/SuppOrder.dart';
import 'package:duckstore/DashBoarditem/SuppStatics.dart';
import 'package:duckstore/DashBoarditem/my_store.dart';
import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:flutter/material.dart';

List<String> label = [
  'my Store',
  'orders',
  'edit profile',
  'manage products',
  'balance',
  'statics'
];

List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart,
];

List<Widget> page = [
  MyStore(),
  SuppOrders(),
  EditBusiness(),
  ManageProducts(),
  SuppBalance(),
  SuppStatics()
];

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: AppBarTitle(subcategName: 'Dashboard'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => page[index]));
              },
              child: Card(
                elevation: 17,
                shadowColor: Colors.purpleAccent,
                color: Colors.blueGrey.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      icons[index],
                      size: 50,
                      color: Colors.yellowAccent,
                    ),
                    Text(
                      label[index].toUpperCase(),
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Acme'),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
