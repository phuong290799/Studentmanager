import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_student/Controller/controller.dart';
import 'package:flutter_student/HomePage/homePage.dart';
import 'package:get/get.dart';
class AddStudent extends StatefulWidget {
  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String id, name, image, address, note;
  late String gpa;
  Controller controlleradd = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nhập đủ họ tên';
                      } else {
                        name = value;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Nhập Họ Tên",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nhập địa chỉ';
                      } else {
                        address = value;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Nhập địa chỉ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                  ),

                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Nhập điểm trung bình';
                      } else {
                        gpa= input;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Nhập điểm trung bình",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return note="không có";
                      } else {
                        note = value;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Nhập note",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                  ),


                  TextButton(
                      onPressed: () {
                        upload().then((value) => controlleradd.ReadStudent().then((value) => Get.to(HomePage())));
                      },
                      child: Text("button2"),
                    ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> upload() async {
    if (formKey.currentState!.validate()) {
    final ref = FirebaseFirestore.instance.collection('Student').doc();
        var  map ={
          'id': ref.id,
          'name': name,
          'address': address,
          'image': "assets/images/image1.jpg",
          'gpa': gpa,
          'note': note,
      };
    controlleradd.UpStudent(map);
    }
  }
}
