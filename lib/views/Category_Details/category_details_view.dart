import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/consts.dart';
import 'package:doctor_app/views/Doctor_Profile/doc_profile_view.dart';
import 'package:get/get.dart';


class CategoryDetailsView extends StatelessWidget {
  final String catName;
  const CategoryDetailsView({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: AppStyles.bold(
              title: catName,
              color: AppColours.whiteColor,
              size: AppSizes.size18)),
      body:
          // Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: GridView.builder(
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           mainAxisExtent: 200,
          //           crossAxisSpacing: 8,
          //           mainAxisSpacing: 8),
          //       itemCount: 10,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Container(
          //           clipBehavior: Clip.hardEdge,
          //           decoration: BoxDecoration(
          //               color: Colors.black87,
          //               borderRadius: BorderRadius.circular(20)),
          //           // margin: const EdgeInsets.only(right: 8),
          //           margin: const EdgeInsets.only(right: 8),
          //           height: 40,
          //           width: 40,
          //           // height: 100,
          //           // width: 150,
          //           //color: Colors.red,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Container(
          //                 //color: AppColours.blueColor,
          //                 color: Colors.amber,
          //                 width: 180,
          //                 //height: 150,
          //                 alignment: Alignment.center,
          //                 child: Image.asset(
          //                   AppAssets.imgSignUp,
          //                   width: 130,
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //               const Divider(
          //                 height: 5,
          //                 color: AppColours.whiteColor,
          //               ),
          //               AppStyles.normal(
          //                   title: "Doctor Name", color: AppColours.whiteColor),
          //               VxRating(
          //                 onRatingUpdate: (value) {},
          //                 count: 5,
          //                 isSelectable: false,
          //                 value: 4,
          //                 maxRating: 5,
          //                 stepInt: true,
          //                 // normalColor: AppColours.yellowColor,
          //                 //selectionColor: AppColours.yellowColor,
          //                 selectionColor: Colors.amber,
          //               ),
          //               // AppStyles.normal(
          //               //     title: "Category", color: AppColours.whiteColor),
          //             ],
          //           ),
          //         );
          //       }),
          // ),
          FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('Doctors')
            .where('docCategory', isEqualTo: catName)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data?.docs;

            return Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(20)),
                      // margin: const EdgeInsets.only(right: 8),
                      margin: const EdgeInsets.only(right: 8),
                      height: 40,
                      width: 40,
                      // height: 100,
                      // width: 150,
                      //color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            //color: AppColours.blueColor,
                            color: Colors.amber,
                            width: 180,
                            //height: 150,
                            alignment: Alignment.center,
                            child: Image.asset(
                              AppAssets.imgSignUp,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Divider(
                            height: 5,
                            color: AppColours.whiteColor,
                          ),
                          AppStyles.normal(
                              title: data![index]['docName'],
                              color: AppColours.whiteColor),
                          VxRating(
                            onRatingUpdate: (value) {},
                            count: 5,
                            isSelectable: false,
                            value: double.parse(
                                data[index]['docRating'].toString()),
                            maxRating: 5,
                            stepInt: true,
                            // normalColor: AppColours.yellowColor,
                            //selectionColor: AppColours.yellowColor,
                            selectionColor: Colors.amber,
                          ),
                          // AppStyles.normal(
                          //     title: "Category", color: AppColours.whiteColor),
                        ],
                      ),
                    ).onTap(() {
                      Get.to(() => DoctorProfileView(doc: data[index]));
                    });
                  }),
            );
          }
        },
      ),
    );
  }
}
