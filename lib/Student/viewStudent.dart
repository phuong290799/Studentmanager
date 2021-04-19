import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_student/Controller/controller.dart';
import 'package:flutter_student/HomePage/homePage.dart';
import 'package:flutter_student/Style/colors.dart';
import 'package:flutter_student/Style/style.dart';
import 'package:get/get.dart';
class ViewStudent extends StatefulWidget {
  late String id ,name,address,note,image;
  String gpa;
  ViewStudent({required this.id,required this.name,required this.image,required this.address,required this.gpa,required this.note});
  @override
  _ViewStudentState createState() => _ViewStudentState();
}

class _ViewStudentState extends State<ViewStudent> {
  Controller controllerView =Get.find();
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
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Text(widget.name),
            Text('${widget.gpa}'),
            Text(widget.address),
            Image.asset(widget.image,height: 200,width: 175,),
            Text(widget.note),
            Text(widget.id),
            TextButton(
              onPressed: () {
                 controllerView.DeleteStudent(widget.id);
                  Get.to(() =>HomePage());
                  controllerView.ReadStudent();
              },
              child: Text("delete"),
            ),
          ],
        ),
      ),
    );
  }
}
