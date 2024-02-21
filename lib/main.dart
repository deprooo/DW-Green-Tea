import 'package:flutter/material.dart';
import 'package:tea_shop/screen/register.dart';
import 'package:tea_shop/screen/menu.dart';
import 'package:tea_shop/screen/welcome_screen.dart';
//import 'package:tea_shop/screen/welcome_screen.dart';

bool _isPasswordVisible = false;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Login(usersData: []),
      home: WelcomeScreen(),
      //  home: CoffeeShopApp(),
    ),
  );
}

class Login extends StatefulWidget {
  final List<UserData> usersData;

  Login({required this.usersData});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _loginUser() {
    String username = usernameController.text;
    String password = passwordController.text;

    // Validasi jika data belum lengkap
    if (username.isEmpty || password.isEmpty) {
      _showNotification('Please enter both username and password.');
      return;
    }

    UserData? user = widget.usersData.isNotEmpty
        ? widget.usersData.firstWhere(
            (user) => user.username == username && user.password == password,
          )
        : null;

    // Validasi jika data yang diinput salah
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoffeeShopApp(),
        ),
      );
    } else {
      _showNotification('Username or password is incorrect. Please try again.');
      return;
    }
  }

  void _showNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Close the keyboard when tapping outside of text fields
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/page-1/images/green-tea-by-stocksy-contributor-susan-brooks-dammann-1.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              width: 370,
              height: 700,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Image.asset(
                            'assets/page-1/images/logooo-1.png',
                            width: 150,
                            height: 100,
                          ),
                          SizedBox(height: 52),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context)
                          .size
                          .width, // Adjust width dynamically
                      // Adjust height dynamically
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF005B41),
                            Color(0xFF005B10),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.9),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: "Italianno",
                              ),
                            ),
                            SizedBox(height: 40),
                            TextField(
                              controller: usernameController,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: "Italianno",
                              ),
                              decoration: InputDecoration(
                                labelText: 'Username',
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(height: 10),
                            TextField(
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: "Italianno",
                              ),
                              controller: passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(height: 70),
                            ElevatedButton(
                              onPressed: () {
                                _loginUser(); // Memanggil fungsi _loginUser
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal[900],
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 241, 161, 13),
                                  fontFamily: "Italianno",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Register(
                                      usersData: widget.usersData,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Don\'t have an account? Register here.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
