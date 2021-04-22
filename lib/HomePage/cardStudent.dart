import 'package:flutter/material.dart';
import 'package:flutter_student/Student/viewStudent.dart';
import 'package:flutter_student/Style/colors.dart';
import 'package:get/get.dart';

class CardStudent extends StatefulWidget {
  String image,name,tuoi,phone,address,gioithieu,id;
  CardStudent({required this.image,required this.name,required this.tuoi,required this.phone,required this.address,required this.gioithieu,required this.id});

  @override
  _CardStudentState createState() => _CardStudentState();
}

class _CardStudentState extends State<CardStudent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.Scaffor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1,color:AppColors.gray)
        // boxShadow: [
        //   BoxShadow(
        //     blurRadius: 5,
        //     offset: Offset(0,0),
        //     color: AppColors.gray
        //   )
        //]
      ),
      child: GestureDetector(
        onTap: (){
          Get.to(()=> ViewStudent(image:widget.image,name:widget.name,tuoi:widget.tuoi,address:widget.address,phone:widget.phone,gioithieu:widget.gioithieu,id: widget.id));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              child: Image.network(
                widget.image,
                fit: BoxFit.contain,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Tên: " + widget.name,style:TextStyle(color: Colors.black, fontSize: 16),),
                SizedBox(
                  width: 10,
                ),
                Text("Tuổi: " + widget.tuoi,style:TextStyle(color: Colors.black, fontSize: 16),),
                SizedBox(
                  width: 10,
                ),

              ],
            )
            // Text("Địa chỉ: "+address),
          ],
        ),
      ),

    );
  }
}
