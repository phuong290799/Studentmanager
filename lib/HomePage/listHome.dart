import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_student/HomePage/homePage.dart';
import 'package:flutter_student/Student/viewStudent.dart';
import 'package:flutter_student/Style/colors.dart';
import 'package:flutter_student/Style/style.dart';
import 'package:get/get.dart';

class ListHome extends StatefulWidget {
  late String id, name, image, address, gpa, note;
  ListHome(
      {required this.id,
      required this.name,
      required this.image,
      required this.address,
      required this.gpa,
      required this.note});

  @override
  _ListHomeState createState() => _ListHomeState();
}

class _ListHomeState extends State<ListHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10),
      //padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.Scaffor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(4, 8),
            )
          ]),
      child: GestureDetector(
        onTap: () {
          Get.to(() => (ViewStudent(
              id: widget.id,
              name: widget.name,
              address: widget.address,
              image: widget.image,
              gpa: widget.gpa,
              note: widget.note)));
        },
        child: Row(
          children: [
            Image.asset(
              widget.image,
              height: 100,
              width: 80,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.name,
              style: AppThemes.Text20,
            ),
          ],
        ),
      ),
    );
  }
}
