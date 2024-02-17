// ignore_for_file: use_key_in_widget_constructors

import 'package:doctor_app/consts/consts.dart';
import 'package:doctor_app/controllers/auth_controller.dart';

import 'package:doctor_app/res/components/custom_button.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:doctor_app/views/HomeView/home.dart';
import 'package:get/get.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var isDoctor = false;
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
                    AppAssets.imgSignUp,
                    //width: 200,
                    // height: 200,
                  ),
                  10.heightBox,
                  AppStyles.bold(
                    title: AppStrings.signup,
                    size: AppSizes.size16,
                  ),
                  10.heightBox,
                  AppStyles.bold(
                      title: AppStrings.signupNoew,
                      color: Colors.lightBlue,
                      alignment: TextAlign.center),
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
                          hint: AppStrings.fullname,
                          textEditingController: controller.fullnameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            hint: AppStrings.email,
                            textEditingController: controller.emailController),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                            hint: AppStrings.password,
                            textEditingController:
                                controller.passwordController),
                        10.heightBox,
                        //10.heightBox,
                        SwitchListTile(
                            title: "Sign-Up as a Doctor".text.make(),
                            value: isDoctor,
                            onChanged: (newValue) {
                              setState(() {
                                isDoctor = newValue;
                              });
                            }),

                        Visibility(
                          visible: isDoctor,
                          child: Column(
                            children: [
                              CustomTextField(
                                  hint: "About",
                                  textEditingController:
                                      controller.aboutController),
                              10.heightBox,
                              CustomTextField(
                                  hint: "Category",
                                  textEditingController:
                                      controller.categoryController),
                              10.heightBox,
                              CustomTextField(
                                  hint: "Service",
                                  textEditingController:
                                      controller.serviceController),
                              10.heightBox,
                              CustomTextField(
                                  hint: "Address",
                                  textEditingController:
                                      controller.addressController),
                              10.heightBox,
                              CustomTextField(
                                  hint: "Phone Number",
                                  textEditingController:
                                      controller.phoneController),
                              10.heightBox,
                              CustomTextField(
                                  hint: "Timing",
                                  textEditingController:
                                      controller.timingController),
                              10.heightBox,
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: AppStyles.normal(
                        //       title: AppStrings.forgetPassword),
                        // ),
                        20.heightBox,
                        CustomButton(
                          buttonText: AppStrings.signup,
                          onTap: () async {
                            await controller.signUpUser(isDoctor);
                            if (controller.userCredinal != null) {
                              Get.offAll((const Home()));
                            }
                          },
                        ),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppStyles.normal(
                                title: AppStrings.alreadyHaveAccount),
                            8.widthBox,
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: AppStyles.bold(
                                title: AppStrings.login,
                              ),
                            )
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
