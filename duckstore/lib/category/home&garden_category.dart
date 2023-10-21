import 'package:duckstore/minor_screen/SubCategProduct.dart';
import 'package:duckstore/utils/categ_list.dart';
import 'package:duckstore/widgets/categ_List.dart';
import 'package:flutter/material.dart';

// List<String> imagetry = [
//   'assets/images/try/image0.jpg',
//   'assets/images/try/image1.jpg',
//   'assets/images/try/image2.jpg',
//   'assets/images/try/image3.jpg',
// ];

class HomeAndGardenCategory extends StatelessWidget {
  const HomeAndGardenCategory({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                categlabel(
                  headerLine: 'home and garden',
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15, // Adjusted mainAxisSpacing
                      crossAxisSpacing: 15,
                      children: List.generate(homeandgarden.length, (index) {
                        return SubCateg(
                          mainCategName: 'home and garden',
                          subCategName: homeandgarden[index],
                          subCategList:
                              'assets/images/homegarden/home$index.jpg',
                          subCategLabel: homeandgarden[index],
                        );
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SubCateg1(
            mainCategName: 'home & garden',
          ),
        ),
      ],
    );
  }
}
