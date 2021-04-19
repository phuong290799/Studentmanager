import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_student/Models/studentObj.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final  list = RxList<StudentObj>([]);
  //var list = <StudentObj>[].obs;

  Future<void> ReadStudent() async {
    list.clear();
    await FirebaseFirestore.instance.collection('Student').get().then((
        QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        StudentObj data = new StudentObj(
          doc["id"],
          doc["name"],
          doc["image"],
          doc["address"],
          doc["gpa"],
          doc["note"],
        );
        list.add(data);
        print(data.name);
      });
    });
  }



  Future<void> UpStudent(map) async {
      await FirebaseFirestore.instance.collection('Student').doc().set(map);
    }


    updateData(selectedDoc, newValues) {
      FirebaseFirestore.instance
          .collection('Student')
          .doc(selectedDoc)
          .update(newValues)
          .catchError((e) {
        print(e);
      });
    }

  Future<void> DeleteStudent(id) async {
    FirebaseFirestore.instance
        .collection('Student')
        .doc(id)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addData(listdata) async {
    FirebaseFirestore.instance
        .collection('Student')
        .add(listdata)
        .catchError((e) {});
  }
}
