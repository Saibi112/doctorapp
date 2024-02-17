//import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/consts.dart';
import 'package:doctor_app/consts/lists.dart';
import 'package:doctor_app/controllers/home_controller.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:doctor_app/views/Category_Details/category_details_view.dart';
import 'package:doctor_app/views/Doctor_Profile/doc_profile_view.dart';
import 'package:doctor_app/views/search_view/search_view.dart';

import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColours.blueColor,
          title: AppStyles.bold(
              title: "${AppStrings.welcome} User",
              color: Colors.white,
              size: AppSizes.size18)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              color: AppColours.blueColor,
              //height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      textEditingController: controller.searchQueryController,
                      hint: AppStrings.search,
                      borderColor: AppColours.whiteColor,
                      textColor: AppColours.whiteColor,
                      inputColor: AppColours.whiteColor,
                    ),
                  ),
                  10.widthBox,
                  IconButton(
                      onPressed: () {
                        Get.to(() =>  SearchView(searchQuery: controller.searchQueryController.text,));
                      },
                      icon: const Icon(
                        Icons.search,
                        color: AppColours.whiteColor,
                      ))
                ],
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 85,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        // Your logic to build the item at the specified index
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => CategoryDetailsView(
                                catName: iconsTitleList[index]));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColours.blueColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(14),
                            margin: const EdgeInsets.only(right: 8),

                            // height: 44,
                            // width: 44,
                            child: Column(children: [
                              Image.asset(
                                iconsList[index],
                                width: 35,
                                color: AppColours.whiteColor,
                              ),
                              2.heightBox,
                              AppStyles.normal(
                                title: iconsTitleList[index],
                                color: AppColours.whiteColor,
                              )
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                  11.heightBox,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: AppStyles.bold(
                          title: "Popular Doctors",
                          color: AppColours.blueColor,
                          size: AppSizes.size18)),
                  // SizedBox(
                  //   height: 150,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       physics: const ClampingScrollPhysics(),
                  //       itemCount: 3,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return GestureDetector(
                  //           onTap: () {
                  //             Get.to(() => const DoctorProfileView());
                  //           },
                  //           child: Container(
                  //             clipBehavior: Clip.hardEdge,
                  //             decoration: BoxDecoration(
                  //                 color: Colors.black12,
                  //                 borderRadius: BorderRadius.circular(20)),
                  //             margin: const EdgeInsets.only(right: 8),
                  //             height: 100,
                  //             width: 150,
                  //             //color: Colors.red,
                  //             child: Column(
                  //               children: [
                  //                 Container(
                  //                   color: AppColours.blueColor,
                  //                   width: 150,
                  //                   alignment: Alignment.center,
                  //                   child: Image.asset(
                  //                     AppAssets.imgSignUp,
                  //                     width: 100,
                  //                     fit: BoxFit.cover,
                  //                   ),
                  //                 ),
                  //                 const Divider(
                  //                   height: 5,
                  //                   color: AppColours.whiteColor,
                  //                 ),
                  //                 AppStyles.normal(title: "Doctor Name"),
                  //                 AppStyles.normal(title: "Category"),
                  //               ],
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // ),
                  FutureBuilder<QuerySnapshot>(
                      future: controller.getDoctorList(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var data = snapshot.data?.docs;
                          //log(data!.length.toString());
                          //log(data!.length.toString());
                          //log(data!.length.toString());
                          return SizedBox(
                            height: 150,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const ClampingScrollPhysics(),
                                itemCount: data?.length ?? 0,
                                //itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () =>
                                            DoctorProfileView(doc: data[index]),
                                      );
                                    },
                                    child: Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      margin: const EdgeInsets.only(right: 8),
                                      height: 100,
                                      width: 150,
                                      //color: Colors.red,
                                      child: Column(
                                        children: [
                                          Container(
                                            color: AppColours.blueColor,
                                            width: 150,
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              AppAssets.imgSignUp,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const Divider(
                                            height: 5,
                                            color: AppColours.whiteColor,
                                          ),
                                          AppStyles.normal(
                                              title: data![index]['docName']),
                                          AppStyles.normal(
                                              title: data[index]
                                                  ['docCategory']),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }
                      }),
                  5.heightBox,
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AppStyles.bold(
                          title: "View All", color: AppColours.blueColor),
                    ),
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => Container(
                        decoration: BoxDecoration(
                            color: AppColours.blueColor,
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.asset(
                              AppAssets.icBody,
                              width: 30,
                              color: AppColours.whiteColor,
                            ),
                            5.heightBox,
                            AppStyles.normal(
                                title: "Lab Test",
                                color: AppColours.whiteColor),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
