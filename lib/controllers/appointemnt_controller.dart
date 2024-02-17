import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppoitemntController extends GetxController {
  var isLoading = false.obs;

  var apptDayController = TextEditingController();
  var appTimeController = TextEditingController();
  var appMobileController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();
  //var docName = ''.obs;

  bookAppoitemnt(String docId, String docName, BuildContext context) async {
    isLoading(true);
    var store = FirebaseFirestore.instance.collection('appointments').doc();//appointments


    await store.set({
      'appBy': FirebaseAuth.instance.currentUser?.uid,
      'appDay': apptDayController.text,
      'appTime': appTimeController.text,
      'appMobile': appMobileController.text,
      'appname': appNameController.text,
      'appMessage': appMessageController.text,
      'appWith': docId,
      'appWithName': docName,
    }).then((_) {
      isLoading(false);
      VxToast.show(context, msg: "Appointment is Booked Successfully");
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppoitemnt(bool isDoctor) {
    if (isDoctor) {
      return FirebaseFirestore.instance
          .collection('appointments')
          .where('appWith', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
    } else {
      return FirebaseFirestore.instance
          .collection('appointments')
          .where('appBY', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get();
    }
  }
}
