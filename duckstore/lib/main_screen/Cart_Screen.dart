import 'package:duckstore/main_screen/Customer_Screen.dart';
import 'package:duckstore/widgets/Appbar_widgets.dart';
import 'package:duckstore/widgets/YellowButton.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({super.key, this.back});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: widget.back,
        elevation: 0,
        backgroundColor: Colors.white,
        title: AppBarTitle(subcategName: 'Cart'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_forever,
                color: Colors.black,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Cart Is Empty',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            Material(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(25),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.6,
                onPressed: () {
                  Navigator.canPop(context)
                      ? Navigator.pop(context)
                      : Navigator.pushReplacementNamed(
                          context, 'CustomerHomeScreen');
                },
                child: Text(
                  'Continue shopping',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Total \$ ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '00.00',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
            YellowButton(
              label: 'CHECK OUT',
              onPressed: () {},
              width: 0.45,
            )
          ],
        ),
      ),
    );
  }
}
