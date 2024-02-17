// ignore_for_file: unused_element

import 'package:doctor_app/consts/consts.dart';
import 'package:doctor_app/views/Appointemnt_view/appointemnet_view.dart';
import 'package:doctor_app/views/HomeView/home.dart';
import 'package:doctor_app/views/login_view/login_view.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserCredential? userCredinal;

  //docEditing Controllers
  var aboutController = TextEditingController();
  var addressController = TextEditingController();
  var serviceController = TextEditingController();
  var timingController = TextEditingController();
  var phoneController = TextEditingController();
  var categoryController = TextEditingController();

  isUserAlreadyLoggedIn() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        var data = await FirebaseFirestore.instance
            .collection('Doctors')
            .doc(user.uid)
            .get();
        var isDoc = data.data()?.containsKey('docName') ?? false;
        if (isDoc) {
          Get.offAll(() => const AppointmentView());
        } else {
          Get.offAll(() => const Home());
        }
      } else {
        Get.offAll(() => const LoginView());
      }
    });
  }

  loginUser() async {
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    try {
        userCredinal = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
    } catch (e) {
        print("Error logging in: $e");
        // Handle error here, such as showing an error message to the user
    }
}


  signUpUser(bool isDoctor) async {
    userCredinal = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    await storeUserData(userCredinal!.user!.uid, fullnameController.text,
        emailController.text, isDoctor);
  }

  storeUserData(
      String uid, String fullname, String email, bool isDoctor) async {
    var store = FirebaseFirestore.instance
        .collection(isDoctor ? 'Doctors' : 'users')
        .doc(uid);
    if (isDoctor) {
      await store.set({
        'docAbout': aboutController.text,
        'docAddress': addressController.text,
        'docCategory': categoryController.text,
        'docName': fullname,
        'docPhone': phoneController.text,
        'docService': serviceController.text,
        'docTiming': timingController.text,
        'docId': FirebaseAuth.instance.currentUser?.uid,
        'docRating': 1,
        'docEmail': email,
      });
    } else {
      await store.set({
        'fullname': fullname,
        'email': email,
      });
    }

  }

  void signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
