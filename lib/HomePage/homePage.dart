import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_student/Controller/controller.dart';
import 'package:flutter_student/HomePage/drawer.dart';
import 'package:flutter_student/HomePage/cardStudent.dart';
import 'package:flutter_student/Login/login.dart';
import 'package:flutter_student/Student/addStudents.dart';
import 'package:flutter_student/Style/colors.dart';
import 'package:flutter_student/Style/style.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name = "";
  Controller _controllerHome = Get.put(Controller());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: Drawer(
        child: OpenDrawer(),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text('Trang chủ', style: AppThemes.Text20Bold),
        backgroundColor: AppColors.Scaffor,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Image.asset("assets/images/cart1.png"),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/admin.png',
              height: 35,
              width: 35,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(140),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text('Chào mừng bạn đến với trang\nQuản lý sinh viên',
                      style: AppThemes.Text16Medium),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.Scaffor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(0, 0), // Shadow position
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 52,
                        width: 250,
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: "Search ",
                              hintStyle: AppThemes.Text14,
                            ),
                            onChanged: (text) {
                              name = text.toString();
                            },
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: AppColors.BACKGROUND,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child:
                            Container(child: Icon(Icons.person_search_rounded)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        // width: MediaQuery.of(context).size.width-40,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                ("Danh sách sinh viên"),
                style: AppThemes.Text20,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12, width: 2),
              ),
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height - 500,
              child: StreamBuilder<QuerySnapshot>(
                  stream: (name != "" && name != null)
                      ? FirebaseFirestore.instance
                          .collection('Student')
                      .where('name',isEqualTo: name)

                      .snapshots()
                      : FirebaseFirestore.instance
                          .collection("Student")
                          .snapshots(),
                  builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                    return (snapshot.connectionState == ConnectionState.waiting)
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              //   DocumentSnapshot data = snapshot.data!.docs[index];

                              // child: StreamBuilder(
                              //     stream: FirebaseFirestore.instance
                              //         .collection('Student')
                              //         .snapshots(),
                              //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              //       if (!snapshot.hasData) {
                              //         return Container(
                              //           child: Center(
                              //             child: Text("Loading...\n Không có dữ liệu"),
                              //           ),
                              //         );
                              //       }
                              //       return ListView.builder(
                              //         itemCount: snapshot.data!.docs.length,
                              //         itemBuilder: (context, index) {
                              //           DocumentSnapshot document = snapshot.data!.docs[index];
                              return Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: CardStudent(
                                  image: snapshot.data!.docs[index]['image'],
                                  name: snapshot.data!.docs[index]['name'],
                                  tuoi: snapshot.data!.docs[index]['tuoi'],
                                  phone: snapshot.data!.docs[index]['phone'],
                                  address: snapshot.data!.docs[index]
                                      ['address'],
                                  gioithieu: snapshot.data!.docs[index]
                                      ['gioithieu'],
                                  id: snapshot.data!.docs[index].id,
                                ),
                              );
                            },
                          );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: RaisedButton(
                onPressed: () {
                  if (_controllerHome.IsLogin) {
                    print("login");
                    print(_controllerHome.IsLogin);
                    Get.to(() => Add());
                  } else {
                    showdialoglogin();
                  }
                },
                color: AppColors.BACKGROUND,
                child: Container(
                  height: 40,
                  child: Center(
                    child: Text(
                      "Thêm sinh viên",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide:
                        BorderSide(color: AppColors.BACKGROUND, width: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void search(String text) {}

  Future<void> showdialoglogin() {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              "     Bạn phải đăng nhập trước!\nBạn có muốn quay lại trang login",
              style: AppThemes.Text16Medium,
            ),
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
}
