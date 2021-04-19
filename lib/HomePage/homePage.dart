import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_student/Controller/controller.dart';
import 'package:flutter_student/HomePage/drawer.dart';
import 'package:flutter_student/HomePage/listHome.dart';
import 'package:flutter_student/Models/studentObj.dart';
import 'package:flutter_student/Student/addStudent.dart';
import 'package:flutter_student/Style/colors.dart';
import 'package:flutter_student/Style/style.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Controller _controllerHome = Get.put(Controller());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
  _controllerHome.ReadStudent();
    super.initState();
    setState(() {
    });
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
                        child: Container(
                            child: GestureDetector(
                                onTap: (){
                                  initState();
                                },
                                child: Icon(Icons.arrow_drop_down_circle_outlined))),
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
              child: _controllerHome.list.length == 0
                  ?Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              ) :
              ListView.builder(
                itemCount: _controllerHome.list.length,
                itemBuilder: (context, index) {
                  print(_controllerHome.list[index].id);
                  return Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ListHome(
                      id: _controllerHome.list[index].id,
                      name: _controllerHome.list[index].name,
                      image: _controllerHome.list[index].image,
                      address: _controllerHome.list[index].address,
                      gpa: _controllerHome.list[index].gpa,
                      note: _controllerHome.list[index].note,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Thêm sinh viên",
                    style: AppThemes.Text20,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(AddStudent());
                      },
                      child: Icon(
                        Icons.add,
                        size: 40,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.BACKGROUND,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
