import 'package:duckstore/minor_screen/SearchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: FakeSearch(),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            indicatorWeight: 5,
            tabs: [
              TabRep(
                label: 'Men',
              ),
              TabRep(
                label: 'Women',
              ),
              TabRep(
                label: 'Shoes',
              ),
              TabRep(
                label: 'Bags',
              ),
              TabRep(
                label: 'Electronics',
              ),
              TabRep(
                label: 'Accessories',
              ),
              TabRep(
                label: 'Home & Garden',
              ),
              TabRep(
                label: 'Kids',
              ),
              TabRep(
                label: 'Beauty',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('men screen '),
            ),
            Center(
              child: Text('women screen '),
            ),
            Center(
              child: Text('shoes screen '),
            ),
            Center(
              child: Text('bags screen '),
            ),
            Center(
              child: Text('Electronics screen '),
            ),
            Center(
              child: Text('shoes screen '),
            ),
            Center(
              child: Text('men screen '),
            ),
            Center(
              child: Text('women screen '),
            ),
            Center(
              child: Text('shoes screen '),
            ),
          ],
        ),
      ),
    );
  }
}

class FakeSearch extends StatelessWidget {
  const FakeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SearchScreen()));
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 1.4),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'What are you looking for?',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                height: 32,
                width: 75,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Text(
                    "Search",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}

class TabRep extends StatelessWidget {
  final String label;
  const TabRep({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
