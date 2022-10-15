import 'package:flutter/material.dart';
import 'package:tiktok/home.dart';

import 'signup.dart';
import 'variables.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: isSigned == false ? Login() : HomePage());
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Container(
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Chào mừng đến với ",
                style: mystyle(25, Colors.white, FontWeight.w700),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "UTube",
                style: mystyle(30, Colors.white, FontWeight.w900),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          labelStyle: mystyle(20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))))),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Mật khẩu',
                          prefixIcon: Icon(Icons.lock),
                          labelStyle: mystyle(20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))))),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.7,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 66, 216, 253),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text("Đăng nhập",
                        style: mystyle(20, Colors.white, FontWeight.w700))),
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Nếu bạn chưa có tài khoản?",
                  style: mystyle(18, Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp())),
                  child: Text(
                    "Đăng ký",
                    style: mystyle(18, Color.fromARGB(255, 66, 216, 253)),
                  ),
                )
              ])
            ])));
  }
}
