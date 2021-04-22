import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_student/Controller/controller.dart';
import 'package:flutter_student/HomePage/homePage.dart';
import 'package:flutter_student/Login/signup.dart';
import 'package:flutter_student/Style/colors.dart';
import 'package:flutter_student/Style/style.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String user, pass;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  Controller _controllerLogin = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.coloricon,
                ),
                decoration: BoxDecoration(
                    color: AppColors.BACKGROUND,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            Text("Đăng Nhập", style: AppThemes.Text20Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.Scaffor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.Scaffor,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 200, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Tên đăng nhập: phuong@gmail.com\nPass: 123321"),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.Scaffor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        offset: Offset(4, 8),
                        color: AppColors.gray,
                      )
                    ]),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nhập tài khoản: ...@gmail.com';
                          } else {
                            user = value;
                          }
                        },
                        style: AppThemes.Text14,
                        decoration: InputDecoration(
                          labelText: "Tên đăng nhập: ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nhập pass';
                          } else {
                            pass = value;
                          }
                        },
                        style: AppThemes.Text14,
                        decoration: InputDecoration(
                          labelText: "Mật khẩu: ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                onPressed: () {
                   _dangnhap();
                  // _controllerLogin.IsLogin = true;
                  // Get.to(HomePage());
                },
                color: AppColors.BACKGROUND,
                child: Container(
                  height: 40,
                  child: Center(
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: AppColors.BACKGROUND, width: 1)),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: _dangky,
                color: AppColors.BACKGROUND,
                child: Container(
                  height: 40,
                  child: Center(
                    child: Text(
                      "Đăng ký",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: AppColors.BACKGROUND, width: 1)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _dangnhap() {
    if (formKey.currentState!.validate()) {
      _fireBaseAuth
          .signInWithEmailAndPassword(email: user, password: pass)
          .then((_) {
        _controllerLogin.IsLogin = true;
        Get.to(HomePage());
      });
    }
  }

  void _dangky() {
    Get.to(Dangky());
  }
}
