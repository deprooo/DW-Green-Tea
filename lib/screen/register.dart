import 'package:flutter/material.dart';
import 'package:tea_shop/main.dart';

class Register extends StatefulWidget {
  final List<UserData> usersData;

  Register({required this.usersData});

  @override
  _RegisterState createState() => _RegisterState();
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

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isPasswordVisible = false;
  bool _registrationSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                  Container(
                    width: 450,
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
                            "Register",
                            style: TextStyle(
                              fontSize: 40,
                              color: const Color.fromARGB(255, 223, 213, 213),
                              fontFamily: "Italianno",
                            ),
                          ),
                          SizedBox(height: 30),
                          _registrationSuccessful
                              ? _buildSuccessMessage()
                              : _buildRegistrationForm(),
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
    );
  }

  Widget _buildRegistrationForm() {
    return Column(
      children: [
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
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
            ),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 10),
        TextField(
          controller: emailController,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: "Italianno",
          ),
          decoration: InputDecoration(
            labelText: 'Email',
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
              Icons.email,
              color: Colors.black,
            ),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 10),
        TextField(
          controller: phoneController,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: "Italianno",
          ),
          decoration: InputDecoration(
            labelText: 'No Telpon',
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
              Icons.phone,
              color: Colors.black,
            ),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 10),
        TextField(
          controller: addressController,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: "Italianno",
          ),
          decoration: InputDecoration(
            labelText: 'Alamat',
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
              Icons.location_on,
              color: Colors.black,
            ),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_validateFields()) {
              UserData newUser = UserData(
                username: usernameController.text,
                password: passwordController.text,
                email: emailController.text,
                phone: phoneController.text,
                address: addressController.text,
              );

              widget.usersData.add(newUser);

              setState(() {
                _registrationSuccessful = true;
              });

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Registrasi Berhasil'),
                    content: Text('Kamu berhasil melakukan registrasi'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Login(usersData: widget.usersData),
                            ),
                          );
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
              // Show a notification that data is incomplete
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Data Salah'),
                    content: Text('Tolong isi data dengan benar!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
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
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Italianno",
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSuccessMessage() {
    return Column(
      children: [
        Text(
          'Registrasi Berhasil!',
          style: TextStyle(
            fontSize: 30,
            color: Colors.green,
            fontFamily: "Italianno",
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              // Reset the form after successful registration
              _registrationSuccessful = false;
              usernameController.clear();
              passwordController.clear();
              emailController.clear();
              phoneController.clear();
              addressController.clear();
            });
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.teal[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            'OK',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Italianno",
            ),
          ),
        ),
      ],
    );
  }

  bool _validateFields() {
    if (usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        addressController.text.isEmpty) {
      return false;
    }

    if (!emailController.text.toLowerCase().endsWith('@gmail.com')) {
      _showInvalidEmailDialog();
      return false;
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(phoneController.text)) {
      _showInvalidPhoneDialog();
      return false;
    }

    return true;
  }

  void _showInvalidPhoneDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kesalahan no tlpn'),
          content: Text('Tolong isi nomer telpon dengan benar!.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showInvalidEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kesalahan Email'),
          content: Text('Tolong isi email dengan benar!.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
