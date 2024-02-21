import 'package:flutter/material.dart';
// import 'package:tea_shop/screen/login.dart';
//import 'package:tea_shop/screen/menu.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    ),
  );
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class UserData {
  final String username;
  final String password;
  final String email;
  final String phone;
  final String address;

  UserData({
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.address,
  });
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Ganti data pada UserData sesuai dengan yang diinginkan
  UserData userData = UserData(
    username: 'newuser',
    password: 'newpass',
    email: 'newuser@example.com',
    phone: '9876543210',
    address: '456 Oak St',
  );

  _LoginState();

  void _showLoginFailedNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        content: Container(
          height: 30,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black),
          ),
          child: Text(
            '  Login failed. Username or password is incorrect.',
            style: TextStyle(
              fontFamily: 'Italianno',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  // void _loginUser() {
  //   String username = usernameController.text;
  //   String password = passwordController.text;

  //   if (username == userData.username && password == userData.password) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => CoffeeShopApp(),
  //       ),
  //     );
  //   } else {
  //     _showLoginFailedNotification();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/page-1/images/green-tea-by-stocksy-contributor-susan-brooks-dammann-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: 400,
            height: 400,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Image.asset(
                        'assets/page-1/images/logooo-1.png',
                        width: 150,
                        height: 100,
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  width: 300,
                  height: 600,
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
                        spreadRadius: 9,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 40,
                          color: const Color.fromARGB(255, 223, 213, 213),
                          fontFamily: "Italianno",
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: 250,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
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
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "Italianno",
                          ),
                          controller: passwordController,
                          obscureText: !isPasswordVisible,
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
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              child: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: 90,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Register(),
                            //   ),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: "Italianno",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      Container(
                        width: 90,
                        child: ElevatedButton(
                          onPressed: () {
                            // _loginUser();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: "Italianno",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
