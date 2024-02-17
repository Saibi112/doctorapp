// ignore_for_file: use_key_in_widget_constructors

import 'package:doctor_app/consts/consts.dart';
import 'package:doctor_app/controllers/auth_controller.dart';

import 'package:doctor_app/res/components/custom_button.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:doctor_app/views/Appointemnt_view/appointemnet_view.dart';
import 'package:doctor_app/views/HomeView/home.dart';
import 'package:doctor_app/views/signup_view/signup_view.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isDoctor = false;
  // var isLoading = true;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              //color: Colors.red,
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icLogin,
                    //width: 200,
                    // height: 200,
                  ),
                  10.heightBox,
                  AppStyles.bold(
                    title: AppStrings.welcomeBack,
                    size: AppSizes.size18,
                  ),
                  AppStyles.bold(
                    title: AppStrings.weAreExcited,
                    color: Colors.lightBlue,
                    alignment: TextAlign.center,
                  ),
                ],
              ),
            ),
            20.heightBox,
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          hint: AppStrings.email,
                          textEditingController: controller.emailController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          hint: AppStrings.password,
                          textEditingController: controller.passwordController,
                        ),
                        10.heightBox,
                        SwitchListTile(
                          value: isDoctor,
                          onChanged: (newValue) {
                            setState(() {
                              isDoctor = newValue;
                            });
                          },
                          title: "Sign in as a Doctor".text.make(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: AppStyles.normal(
                              title: AppStrings.forgetPassword),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          buttonText: AppStrings.login,
                          onTap: () async {
                            await controller.loginUser();
                            if (controller.userCredinal != null) {
                              if (isDoctor) {
                                //sign in as doctor
                                Get.to(() => const AppointmentView());
                              } else {
                                //sign in as user
                                Get.to(() => const Home());
                              }
                            }
                          },
                        ),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppStyles.normal(title: AppStrings.dontHaveAccount),
                            8.widthBox,
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const SignupView());
                              },
                              child: AppStyles.bold(
                                title: AppStrings.signup,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
