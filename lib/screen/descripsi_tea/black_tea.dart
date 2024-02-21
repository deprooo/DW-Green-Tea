import 'package:flutter/material.dart';

class BlackTea extends StatelessWidget {
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
                    Colors.black,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  Image.asset(
                    'assets/page-1/images/logooo-1.png',
                    width: 120,
                    height: 80,
                  ),
                  SizedBox(height: 16),
                  SizedBox(height: 16),
                ],
              ),
            ),

            // Bagian Bawah (Menu)
            Container(
              padding: EdgeInsets.all(26),
              child: Column(
                children: [
                  // Spasi antara menu dan gambar
                  SizedBox(height: 5),

                  // Gambar di bagian bawah
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildImageWithLabel(
                        "Teh hitam, hasil oksidasi tinggi dari daun Camellia sinensis, menonjol dengan warna gelap dan cita rasa kuatnya. Jenis teh ini, seperti Assam, Darjeeling, dan Earl Grey, populer karena variasi rasanya. Kaya kafein, teh hitam dapat dinikmati dengan atau tanpa susu serta pemanis. Selain nikmat, teh hitam kaya antioksidan yang mendukung kesehatan jantung dan melindungi sel-sel tubuh. Sebagai minuman global, teh hitam memikat banyak penikmat dengan karakteristik uniknya.",
                        'assets/page-1/images/blackteadescripsi.jpg',
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

  Widget buildImageWithLabel(String label, String imagePath) {
    return Container(
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
      child: Column(
        children: [
          Container(
            width: 300,
            height: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Black Tea",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontFamily: "Italianno",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 0),
          Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: "Sriracha",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
