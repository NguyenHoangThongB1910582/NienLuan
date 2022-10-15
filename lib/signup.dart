import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/navigation.dart';
import 'variables.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  registeruser() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text)
        .then((signeduser) {
      usercollection.doc(signeduser.user!.uid).set({
        'username': usernamecontroller.text,
        'password': passwordcontroller.text,
        'email': emailcontroller.text,
        'uid': signeduser.user!.uid,
        'profilepoc':
            'https://helsinkisailing.com/wp-content/uploads/2020/01/profile-pic.png'
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Container(
            alignment: Alignment.center,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Chuẩn bị đến với ",
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
                      controller: emailcontroller,
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
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Tên đăng nhập',
                          prefixIcon: Icon(Icons.person),
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
                      controller: passwordcontroller,
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
              InkWell(
                onTap: () => registeruser(),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.7,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 66, 216, 253),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text("Đăng ký",
                          style: mystyle(20, Colors.white, FontWeight.w700))),
                ),
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Đồng ý với",
                  style: mystyle(18, Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login())),
                  child: Text(
                    "Điều khoản",
                    style: mystyle(18, Color.fromARGB(255, 66, 216, 253)),
                  ),
                )
              ]),
              SizedBox(
                height: 12,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Nếu bạn đã có tài khoản?",
                  style: mystyle(18, Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login())),
                  child: Text(
                    "Đăng nhập",
                    style: mystyle(18, Color.fromARGB(255, 66, 216, 253)),
                  ),
                )
              ])
            ])));
  }
}
