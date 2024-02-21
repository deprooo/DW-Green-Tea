import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuTehDingin(),
    ),
  );
}

class Menu {
  final String menuName;
  final String imagePath;
  final String productName;
  final String starImagePath;
  final String productPrice;

  Menu(
    this.menuName,
    this.imagePath,
    this.productName,
    this.starImagePath,
    this.productPrice,
  );
}

class MenuTehDingin extends StatefulWidget {
  @override
  _MenuTehDinginState createState() => _MenuTehDinginState();
}

class _MenuTehDinginState extends State<MenuTehDingin> {
  List<Menu> daftarMenu = [
    Menu(
      "ES Red Berry Tea",
      'assets/page-1/images/c1.jpeg',
      'ES Red Berry Tea',
      'assets/bintang.png',
      'Rp 20,000',
    ),
    Menu(
      "ES milk tea",
      'assets/page-1/images/c3.jpeg',
      'ES milk tea',
      'assets/bintang.png',
      'Rp 20,000',
    ),
    // Tambahkan data menu lainnya sesuai kebutuhan
  ];

  List<Menu> daftarMenuFiltered = [];

  @override
  void initState() {
    super.initState();
    daftarMenuFiltered = daftarMenu;
  }

  void _navigateToAddProduct(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute<Menu>(
        builder: (context) => AddProductScreen(),
      ),
    );

    if (result != null) {
      setState(() {
        daftarMenu.add(result);
        _handleSearch(""); // Update daftarMenuFiltered
      });
    }
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isNotEmpty) {
        daftarMenuFiltered = daftarMenu
            .where((menu) =>
                menu.menuName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        daftarMenuFiltered = List.from(daftarMenu);
      }
      // Let's move the matched product to the top
      daftarMenuFiltered.sort((a, b) {
        if (a.menuName.toLowerCase().startsWith(query.toLowerCase())) {
          return -1;
        } else if (b.menuName.toLowerCase().startsWith(query.toLowerCase())) {
          return 1;
        }
        return 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/page-1/images/latarharga.png'), // Adjust the path as needed
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.2), // Adjust opacity here
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
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
                      Container(
                        width: 250,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Icon(Icons.search),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                onChanged: _handleSearch,
                                decoration: InputDecoration(
                                  hintText: "Search",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Bagian Bawah (Menu)
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      for (var product in daftarMenuFiltered.isNotEmpty
                          ? daftarMenuFiltered
                          : daftarMenu)
                        buildMenuBox(
                          product.menuName,
                          product.imagePath,
                          product.productName,
                          product.starImagePath,
                          product.productPrice,
                        ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
                SizedBox(height: 15),

                // Tombol Tambah Produk
                ElevatedButton(
                  onPressed: () => _navigateToAddProduct(context),
                  child: Text("Tambah Produk"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuBox(String menuName, String imagePath, String NamaProduk,
      String bintang, String HargaProduk) {
    return Container(
      width: 195,
      height: 220,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 8),
          Container(
            width: 180,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 165,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    NamaProduk,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Container(
                        margin: EdgeInsets.only(right: 5),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(bintang),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    HargaProduk,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 192, 189, 19),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddProductScreen extends StatelessWidget {
  final TextEditingController _menuNameController = TextEditingController();
  final TextEditingController _imagePathController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _starImagePathController =
      TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Produk"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _menuNameController,
              decoration: InputDecoration(labelText: "Nama Menu"),
            ),
            TextField(
              controller: _imagePathController,
              decoration: InputDecoration(labelText: "Path Gambar Menu"),
            ),
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(labelText: "Nama Produk"),
            ),
            TextField(
              controller: _starImagePathController,
              decoration:
                  InputDecoration(labelText: "Path Gambar Jimlah Bintang"),
            ),
            TextField(
              controller: _productPriceController,
              decoration: InputDecoration(labelText: "Harga Produk"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Menu newProduct = Menu(
                  _menuNameController.text,
                  _imagePathController.text,
                  _productNameController.text,
                  _starImagePathController.text,
                  _productPriceController.text,
                );

                Navigator.pop(context, newProduct);
              },
              child: Text("Tambahkan Produk"),
            ),
          ],
        ),
      ),
    );
  }
}
