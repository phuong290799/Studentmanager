import 'package:flutter/material.dart';
import 'package:flutter_student/Controller/controller.dart';
import 'package:flutter_student/HomePage/homePage.dart';
import 'package:flutter_student/HomePage/splash.dart';
import 'package:flutter_student/Login/login.dart';
import 'package:flutter_student/Student/addStudents.dart';
import 'package:flutter_student/Style/colors.dart';
import 'package:flutter_student/Style/style.dart';
import 'package:get/get.dart';

class OpenDrawer extends StatelessWidget {


  Controller controllerDrawer = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColors.BACKGROUND,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset("assets/images/admin.png"),

                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Admin",
                      style: AppThemes.Text16Medium,
                    ),
                    Text(
                      "phuong@.com",
                      style: AppThemes.Text14Medium,
                    ),
                  ],
                ),
              )),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.home),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "My Home",
                  style: AppThemes.Text16,
                )
              ],
            ),
            onTap: () {Get.to(HomePage());},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.post_add_outlined),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Add Student",
                  style: AppThemes.Text16,
                )
              ],
            ),
            onTap: () {
              if(controllerDrawer.IsLogin){
                Get.to(()=>Add());
              }else{
               showDialog(
                    context: context,
                    builder: (BuildContext) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text("     Bạn phải đăng nhập trước!\nBạn có muốn quay lại trang login",style: AppThemes.Text16Medium,),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        content: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Get.off(Login());
                                  },
                                  child: Text("Có")),
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("Không")),
                            ],
                          ),
                        ),
                      );
                    });
              }
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.connect_without_contact),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Contact Us",
                  style: AppThemes.Text16,
                )
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Setting",
                  style: AppThemes.Text16,
                )
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.exit_to_app),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Sign Out",
                  style: AppThemes.Text16,
                )
              ],
            ),
            onTap: () {
              controllerDrawer.IsLogin = false;
              Get.off(()=>Splash());},
          ),
        ],
      ),
    );
  }
}
