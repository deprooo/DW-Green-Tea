import 'package:flutter/material.dart';
import 'package:tea_shop/main.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Delay selama 8 detik, kemudian pindah ke screen selanjutnya
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login(usersData: [])),
      );
    });
  }

  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          height: 926 * fem,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Align(
                      child: SizedBox(
                        width: 451 * fem,
                        height: 926 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 2, 106, 77),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Align(
                      child: SizedBox(
                        width: 300 * fem,
                        height: 926 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 48, 43, 43)
                                    .withOpacity(0.5),
                                blurRadius: 10,
                                offset: Offset(
                                  30,
                                  0,
                                ), // Sesuaikan offset untuk bayangan di sebelah kiri
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/page-1/images/green-tea-by-stocksy-contributor-susan-brooks-dammann-1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 216 * fem,
                      height: 139 * fem,
                      child: Image.asset(
                        'assets/page-1/images/logooo-1-qYu.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
