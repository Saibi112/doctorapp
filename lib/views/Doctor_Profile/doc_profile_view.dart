// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/consts.dart';

import 'package:doctor_app/res/components/custom_button2.dart';
import 'package:doctor_app/views/Book_Appointemnt/book_appointment_view.dart';
import 'package:get/get.dart';

class DoctorProfileView extends StatelessWidget {
  final DocumentSnapshot doc;
  const DoctorProfileView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: AppStyles.bold(
              title: "Doctor Details",
              color: AppColours.whiteColor,
              size: AppSizes.size18)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Image.asset(AppAssets.imgSignUp),
                    ),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppStyles.bold(
                              title: doc['docName'],
                              color: AppColours.whiteColor,
                              size: AppSizes.size14),
                          AppStyles.bold(
                              title: doc['docCategory'],
                              color: AppColours.whiteColor.withOpacity(0.5),
                              size: AppSizes.size12),
                          const Spacer(),
                          VxRating(
                            onRatingUpdate: (value) {},
                            count: 5,
                            isSelectable: false,
                            value: double.parse(doc['docRating'].toString()),
                            maxRating: 5,
                            stepInt: true,
                            // normalColor: AppColours.yellowColor,
                            selectionColor: AppColours.yellowColor,
                          )
                        ],
                      ),
                    ),
                    AppStyles.bold(
                        title: "See All Reviews",
                        color: AppColours.blueColor,
                        size: AppSizes.size12)
                  ],
                ),
              ),
              10.heightBox,
              Container(
                padding: const EdgeInsets.all(12),
                height: 700,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: AppStyles.bold(
                        title: "Phone Number",
                        color: AppColours.textColor,
                      ),
                      subtitle: AppStyles.normal(
                          title: doc['docPhone'],
                          color: AppColours.textColor,
                          size: AppSizes.size12),
                      trailing: Container(
                        width: 50,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColours.whiteColor),
                        child: Icon(
                          Icons.phone,
                          color: const Color.fromARGB(255, 43, 37, 37),
                        ),
                      ),
                    ),
                    10.heightBox,
                    AppStyles.bold(
                        title: doc['docAbout'],
                        color: AppColours.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: "This is about section of Doctor",
                        color: AppColours.textColor,
                        size: AppSizes.size12),
                    10.heightBox,
                    AppStyles.bold(
                        title: "Address",
                        color: AppColours.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: doc['docAddress'],
                        color: AppColours.textColor,
                        size: AppSizes.size14),
                    10.heightBox,
                    AppStyles.bold(
                        title: "Woking Time",
                        color: AppColours.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: doc['docTiming'],
                        color: AppColours.textColor,
                        size: AppSizes.size12),
                    10.heightBox,
                    AppStyles.bold(
                        title: "Sevices",
                        color: AppColours.textColor,
                        size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: doc['docService'],
                        color: AppColours.textColor,
                        size: AppSizes.size12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomButton2(
          onTap: () {
            Get.to(() => BookAppointmentView(
                  docId: doc['docId'],
                  docName: doc['docName'],
                ));
          },
          buttonText: "Book An Oppointemnet",
        ),
      ),
    );
  }
}
