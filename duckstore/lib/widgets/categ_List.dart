import 'package:duckstore/minor_screen/SubCategProduct.dart';
import 'package:flutter/material.dart';

class SubCateg1 extends StatelessWidget {
  final String mainCategName;
  const SubCateg1({
    super.key,
    required this.mainCategName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.05,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: RotatedBox(
          quarterTurns: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mainCategName == "beauty"
                  ? const Text('')
                  : Text(
                      '<<',
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 10),
                    ),
              Text(mainCategName.toUpperCase(), style: style),
              mainCategName == 'men'
                  ? const Text('')
                  : Text('>>', style: style),
            ],
          ),
        ),
      ),
    );
  }
}

const style = TextStyle(
  color: Colors.brown,
  fontSize: 16,
  fontWeight: FontWeight.w600,
  letterSpacing: 10,
);

class SubCateg extends StatelessWidget {
  final String mainCategName;
  final String subCategName;
  final String subCategList;
  final String subCategLabel;
  const SubCateg({
    super.key,
    required this.mainCategName,
    required this.subCategName,
    required this.subCategList,
    required this.subCategLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategProduct(
              maincategName: mainCategName,
              subcategName: subCategName,
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image(
              image: AssetImage(subCategList),
            ),
          ),
          Text(
            subCategLabel,
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class categlabel extends StatelessWidget {
  final String headerLine;
  const categlabel({
    super.key,
    required this.headerLine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Text(
        headerLine,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }
}
