import 'package:flutter/material.dart';
import 'package:tea_shop/screen/descripsi_tea/oolong_tea.dart';
import 'package:tea_shop/screen/descripsi_tea/tisates_tea.dart';
import 'package:tea_shop/screen/descripsi_tea/black_tea.dart';
import 'package:tea_shop/screen/descripsi_tea/green_tea.dart';
import 'package:tea_shop/screen/hottea.dart';
import 'package:tea_shop/screen/makanan.dart';
import 'package:tea_shop/screen/peckegingtea.dart';
import 'package:tea_shop/screen/cooltea.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoffeeShopApp(),
    ),
  );
}

class CoffeeShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bagian Atas (Logo dan Search)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF005B41),
                    Colors
                        .black, // Change this to your desired background color
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  Image.asset(
                    'assets/page-1/images/logooo-1.png',
                    width: 120,
                    height: 80,
                  ),
                  SizedBox(height: 32),
                  // Container(
                  //   width: 250,
                  //   height: 30,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   // child: Row(
                  //   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   //   children: [
                  //   //     Row(
                  //   //       children: [
                  //   //         SizedBox(width: 20),
                  //   //         Icon(Icons.search),
                  //   //         SizedBox(width: 10),
                  //   //         Text("Search"),
                  //   //       ],
                  //   //     ),
                  //   //     // Tambahkan widget lain di sini jika diperlukan
                  //   //   ],
                  //   // ),
                  // ),
                ],
              ),
            ),
            // Bagian Bawah (Menu)
            Container(
              // padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildMenuBox(
                          "Hot Tea",
                          'assets/page-1/images/tea-cup9024973.png',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuTehHangat()),
                            );
                          },
                        ),
                        buildMenuBox(
                          "Cool Tea",
                          'assets/page-1/images/fruit-juice5887159.png',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuTehDingin()),
                            );
                          },
                        ),
                        buildMenuBox(
                          "Packaging",
                          'assets/page-1/images/tea-bag3332424.png',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PeckagingTea()),
                            );
                          },
                        ),
                        buildMenuBox(
                          "Snack",
                          'assets/page-1/images/tea1318335.png',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => makanan()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Gambar di bagian bawah
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => oolongtea(),
                            ),
                          );
                        },
                        child: buildImageWithLabel(
                          "Oolong Tea",
                          'assets/page-1/images/oolong.jpeg',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => tisatestea(),
                            ),
                          );
                        },
                        child: buildImageWithLabel(
                          "Tisates Tea",
                          'assets/page-1/images/tisates.jpeg',
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GreenTea(),
                            ),
                          );
                        },
                        child: buildImageWithLabel(
                          "Green Tea",
                          'assets/page-1/images/green.jpeg',
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlackTea(),
                            ),
                          );
                        },
                        child: buildImageWithLabel(
                          "Black Tea",
                          'assets/page-1/images/black.jpeg',
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuBox(String menuName, String imagePath, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 105,
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(height: 8),
                  Text(
                    menuName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "JacquesFrancois",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildImageWithLabel(String label, String imagePath) {
  return Container(
    child: Column(
      children: [
        Container(
          width: 300,
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 3),
        Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
