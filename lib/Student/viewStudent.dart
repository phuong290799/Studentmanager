import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_student/Controller/controller.dart';
import 'package:flutter_student/HomePage/homePage.dart';
import 'package:flutter_student/Login/login.dart';
import 'package:flutter_student/Student/updateStudent.dart';
import 'package:flutter_student/Style/colors.dart';
import 'package:flutter_student/Style/style.dart';
import 'package:get/get.dart';


class ViewStudent extends StatefulWidget {

  String image, name, tuoi, phone, address, gioithieu, id;
  ViewStudent(
      {required this.image,
        required this.name,
        required this.tuoi,
        required  this.phone,
        required this.address,
        required this.gioithieu,
        required  this.id});

  @override
  _ViewStudentState createState() => _ViewStudentState();
}

class _ViewStudentState extends State<ViewStudent> {
  Controller _controllerView = Get.put(Controller());
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
            Text(widget.name, style: AppThemes.Text20Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.Scaffor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child:  Container(
                  height: 200,
                  width: 200,
                  child: FadeInImage(
                    placeholder: AssetImage("assets/images/nam.jpg"),
                    image: NetworkImage( widget.image,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(

                      color: AppColors.Scaffor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            offset: Offset(4,4),
                            color: AppColors.gray
                        )
                      ]
                  ),
                  padding: EdgeInsets.only(left: 50,top: 20,bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "T??n: " + widget.name,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),

                      Text(
                        "Tu???i: " + widget.tuoi,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),

                      Text(
                        "Sdt: " + widget.phone,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),

                      Text(
                        "?????a ch???: " + widget.address,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColors.BACKGROUND,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(4,4),
                            color: AppColors.gray
                        )
                      ]
                  ),
                  child: Center(
                    child: Text(
                      "Gi???i thi???u:",
                      style: AppThemes.Text18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                    padding: EdgeInsets.all(10),
                    width: 350,

                    height: 100,
                    decoration: BoxDecoration(
                        color: AppColors.Scaffor,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(color: AppColors.BACKGROUND),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(4,4),
                              color: AppColors.gray
                          )
                        ]
                    ),
                    child: Text(
                      widget.gioithieu,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                      color: AppColors.BACKGROUND,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(4,4),
                            color: AppColors.gray
                        )
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 20,),
                      Text("S???a:",style: AppThemes.Text16Medium,),
                      IconButton(
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 28,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          if(_controllerView.IsLogin){
                            Get.to(()=>updateStudent(image:widget.image,name:widget.name,tuoi:widget.tuoi,address:widget.address,phone:widget.phone,gioithieu:widget.gioithieu,id: widget.id));
                          }else{
                            showdialoglogin();
                          }

                        },
                      ),
                      SizedBox(width: 30,),
                      // Text(gioithieu),
                      Text("Xo??:",style: AppThemes.Text16Medium,),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 28,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            if(_controllerView.IsLogin){
                              _showdialog();
                            }else{
                              showdialoglogin();
                            }

                            // delete();
                          }),
                      SizedBox(width: 20,),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showdialog() {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text("B???n c?? mu???n xo???"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            content: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                      _controllerView.DeleteStudent(widget.id);
                        Get.to(HomePage());
                      },
                      child: Text("C??")),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Kh??ng")),
                ],
              ),
            ),
          );
        });
  }

  // void delete() {
  //   DatabaseReference reference =
  //   FirebaseDatabase.instance.reference().child("users");
  //   setState(() {
  //     {
  //       reference.child(widget.keyy).remove();
  //     }
  //   });
  // }

  Future<void> showdialoglogin() {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text("     B???n ph???i ????ng nh???p tr?????c!\nB???n c?? mu???n quay l???i trang login",style: AppThemes.Text16Medium,),
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
                      child: Text("C??")),
                  TextButton(
                      onPressed: () {
                      Get.back();
                      },
                      child: Text("Kh??ng")),
                ],
              ),
            ),
          );
        });
  }
}
