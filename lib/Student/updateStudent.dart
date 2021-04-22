import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_student/Controller/controller.dart';
import 'package:flutter_student/HomePage/homePage.dart';
import 'package:flutter_student/Style/colors.dart';
import 'package:flutter_student/Style/style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class updateStudent extends StatefulWidget {
  String image, name, tuoi, phone, address, gioithieu, id;

  updateStudent(
      {required this.image,
      required this.name,
      required this.tuoi,
      required this.phone,
      required this.address,
      required this.gioithieu,
      required this.id});

  @override
  _updateStudentState createState() => _updateStudentState();
}

class _updateStudentState extends State<updateStudent> {
  Controller controllerUpdate = Get.put(Controller());
  bool pic = true;
  final picker = ImagePicker();
  late File image2;
  late String urlImage2;
  late String name2, tuoi2, phone2, address2, gioithieu2;
  final GlobalKey<FormState> keyform = GlobalKey<FormState>();

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
            Text("Update", style: AppThemes.Text20Medium),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        backgroundColor: AppColors.Scaffor,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [pic?
                    Image.network(
                      widget.image,
                      fit: BoxFit.contain,
                      height: 200,
                      width: 200,
                    ):Image.file(image2, fit: BoxFit.contain,
                    height: 200,
                    width: 200,),
                  Text("Đổi ảnh:",style: AppThemes.Text18,),
                  Expanded(child: SizedBox()),
                  Container(
                    child: GestureDetector(
                      onTap: _showDialog,
                      child: Icon(
                        Icons.add_a_photo,
                        color: AppColors.BACKGROUND,
                        size: 50,
                      ),
                    ),
                  ),
                    SizedBox(width: 20,),

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: keyform,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          name2 = widget.name;
                        } else {
                          name2 = value;
                        }
                      },
                      style: AppThemes.Text14,
                      decoration: InputDecoration(
                        labelText: "Họ tên: ${widget.name}",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          tuoi2 = widget.tuoi;
                        } else {
                          tuoi2 = value;
                        }
                      },
                      style: AppThemes.Text14,
                      decoration: InputDecoration(
                        labelText: "Tuổi: ${widget.tuoi}",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          phone2 = widget.phone;
                        } else {
                          phone2 = value;
                        }
                      },
                      style: AppThemes.Text14,
                      decoration: InputDecoration(
                        labelText: 'Số điện thoại: ${widget.phone}',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          address2 = widget.address;
                        } else {
                          address2 = value;
                        }
                      },
                      style: AppThemes.Text14,
                      decoration: InputDecoration(
                        labelText: "Địa chỉ: ${widget.address}",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Giới thiệu",
                      style: AppThemes.Text18,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            gioithieu2 = "Vui tính";
                          } else {
                            gioithieu2 = value;
                          }
                        },
                        style: AppThemes.Text14,
                        decoration: InputDecoration(
                          labelText: "Giới thiệu: ${widget.gioithieu}",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: RaisedButton(
                        onPressed: () {
                          update();

                        },
                        color: AppColors.BACKGROUND,
                        child: Container(
                          height: 40,
                          child: Center(
                            child: Text(
                              "Cập nhật",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: AppColors.BACKGROUND, width: 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> update() async {

    if (keyform.currentState!.validate()) {
      if (pic == false) {
        Reference _refrence = FirebaseStorage.instance
            .ref()
            .child("users")
            .child(new DateTime.now().microsecondsSinceEpoch.toString() +
                "." +
                image2.path);
        UploadTask uploadTask = _refrence.putFile(image2);
        var imageUrl = await (await uploadTask).ref.getDownloadURL();
        urlImage2 = imageUrl.toString();
      } else {
        urlImage2 = widget.image;
      }

     var map = {
        'image': urlImage2,
        'name': name2,
        'tuoi': tuoi2,
        'phone': phone2,
        "address": address2,
        'gioithieu': gioithieu2,
      };
       FirebaseFirestore.instance.collection('Student').doc(widget.id).update(map).then((value) => Get.to(() => HomePage()));
      }

    }

  Future<void> _showDialog() {
    return showDialog(
        context: context,
        builder: (Buildcontext) {
          return AlertDialog(
            title: Text("Chọn ảnh"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Mở tệp",
                        style: TextStyle(color: Colors.blue, fontSize: 20)),
                    onTap: () {
                      openGallary();
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  GestureDetector(
                    child: Text("Camera",
                        style: TextStyle(color: Colors.blue, fontSize: 20)),
                    onTap: () {
                      opencamera();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> opencamera() async {
    var picture = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      if (picture != null) {
        image2 = File(picture.path);
        pic=false;
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> openGallary() async {
    var picture = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      if (picture != null) {
        image2 = File(picture.path);
        pic=false;
      } else {
        print('No image selected.');
      }
    });
  }
}
