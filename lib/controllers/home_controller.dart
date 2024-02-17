import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var searchQueryController = TextEditingController();
  var isLoading = false.obs;

  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorList() async {
    // var doctors =  FirebaseFirestore.instance.collection('doctors').snapshots();
    //var doctors =  FirebaseFirestore.instance.collection('doctors').get();
    var doctors = FirebaseFirestore.instance.collection('Doctors').get();
    return doctors;
  }
}
