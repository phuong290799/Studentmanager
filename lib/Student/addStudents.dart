import 'dart:collection';
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

class Add extends StatefulWidget {
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  late final String _url;
  bool pick =true;
 late File _image  ;
 final picker = ImagePicker();
 late  String name, tuoi, phone, address, gioithieu;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Controller controlleradd = Get.put(Controller());

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
            Text("Thêm sinh viên", style: AppThemes.Text20Medium),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  child: pick==true
                      ? FlatButton(
                      onPressed: () {
                        _showDialog();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Thêm ảnh/ Chụp ảnh:",style: AppThemes.Text18,),
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                            size: 50,
                          ),
                        ],
                      ))
                      : Row(
                    children: [
                      Image.file(
                        _image,
                        height: 200,
                        width: 200,
                      ),
                      TextButton(
                          onPressed:(){
                            _showDialog();
                          }, child: Text("Đổi ảnh",style: TextStyle(fontSize: 18),)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nhập họ và tên';
                    } else {
                      name = value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                    labelText: "Nhập tên: ",
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
                      return 'Nhập tuổi';
                    } else {
                      tuoi = value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                    labelText: "Nhập tuổi:",
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
                      return 'Nhập số điện thoại';
                    } else {
                      phone = value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                    labelText: "Nhập số điện thoại:",
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
                      return 'Nhập địa chỉ:';
                    } else {
                      address = value;
                    }
                  },
                  style: AppThemes.Text14,
                  decoration: InputDecoration(
                    labelText: "Nhập địa chỉ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Giới thiệu",style: AppThemes.Text18,),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        gioithieu="Vui tính" ;
                      } else {
                        gioithieu = value;
                      }
                    },
                    style: AppThemes.Text14,
                    decoration: InputDecoration(
                      labelText: "Giới thiệu",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      side: BorderSide(color: AppColors.BACKGROUND, width: 1)),
                  onPressed: () {
                    if (pick== true) {
                      Fluttertoast.showToast(
                          msg: "chọn ảnh",
                          gravity: ToastGravity.CENTER,
                          toastLength: Toast.LENGTH_LONG,
                          timeInSecForIosWeb: 3);
                    } else {
                      upload();
                     // upload().then((value) =>
                     // Get.to(()=>HomePage()));
                      //    cotrollerAdd.ReadStudent();
                    }
                  },
                  child: Container(
                      width: 200,
                      height: 40,
                      child: Center(child: Text("Thêm sinh viên",style: TextStyle(color: Colors.white,fontSize: 16),))),
                  color: AppColors.BACKGROUND,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> upload() async {
    if (_formKey.currentState!.validate()) {
      Reference _refrence = FirebaseStorage.instance.ref().child("users").child(
          new DateTime.now().microsecondsSinceEpoch.toString() +
              "." +
              _image.path);
      UploadTask uploadTask = _refrence.putFile(_image);
      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      if(imageUrl== null){
      _url="assets/images/nam.jpg";}
      else{
         _url = imageUrl.toString();
      }
      var map = {
        'phone': phone,
        'name': name,
        'address': address,
        'image':_url,
        'tuoi': tuoi,
        'gioithieu': gioithieu,
      };
      FirebaseFirestore.instance.collection('Student').doc().set(map).then((value) => Get.to(()=>HomePage()));
      }
    //  controlleradd.UpStudent(map);

    }



  Future<void> _showDialog() {
    return showDialog(
        context: context,
        builder: (Buildcontext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text("Chọn ảnh"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Chọn trong tệp",style: TextStyle(color: Colors.blue,fontSize: 16),),
                    onTap: () {
                      openGallary();
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  GestureDetector(
                    child: Text("Camera",style: TextStyle(color: Colors.blue,fontSize: 16)),
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
        _image = File(picture.path);
        pick=false;
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> openGallary() async {
    var picture = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      if (picture != null) {
        _image = File(picture.path);
        pick=false;
      } else {
        print('No image selected.');
      }
    });
  }
}
