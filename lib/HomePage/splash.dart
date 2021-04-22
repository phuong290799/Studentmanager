import 'package:flutter/material.dart';
import 'package:flutter_student/HomePage/homePage.dart';
import 'package:flutter_student/Login/login.dart';
import 'package:flutter_student/Style/colors.dart';
import 'package:flutter_student/Style/style.dart';
import 'package:get/get.dart';


class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.BACKGROUND,
        child: Column(
          children: [
            SizedBox(height: 200,),
            Container(
              child: Text("Chào mừng bạn đến với ứng dụng",style: AppThemes.Text18,),
            ),
            Text("Quản lý sinh viên",style: TextStyle(fontSize: 25,color: Colors.black,fontFamily:'Roboto_Bold'),),
            SizedBox(height: 80,),
            Image.asset("assets/images/sv2.png",height: 200,width: 250,),
            SizedBox(height: 60,),
            Text("Bạn đã có tài khoản ?"),
            TextButton(onPressed: (){
              Get.to(()=>Login());
            }, child: Text("Đăng nhập để quản lý",style: TextStyle(fontSize: 20),)),
            Text("Hoặc"),
            TextButton(onPressed: (){
              Get.off(()=>HomePage());
            }, child: Text("Sử dụng với tư cách khách",style: TextStyle(fontSize: 20),)),


          ],
        ),
      ),
    );
  }
}
