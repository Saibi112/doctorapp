import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/consts.dart';

import 'package:doctor_app/views/Doctor_Profile/doc_profile_view.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColours.blueColor,
          title: AppStyles.bold(
              title: "Search Result",
              color: Colors.white,
              size: AppSizes.size18)),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('Doctors').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            //var data = snapshot.data?.docs;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var doc = snapshot.data!.docs[index];

                    return !doc['docName']
                            .toString()
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase())

                             //............. ......Ya sab thee krna hai.........................................
                        ? const SizedBox.shrink(
                            // child: Center(
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Image.asset(AppAssets.icSearch),
                            //       // Image.asset(
                            //       //   'assets/your_image.png', // Provide the path to your image asset
                            //       //   height: 100,
                            //       //   width: 100,
                            //       // ),
                            //       const SizedBox(
                            //           height:
                            //               20), // Add some space between the image and text
                            //       const Text(
                            //         "NO RESULT FOUND \n  FOR SPECIFIC RECORD",
                            //         textAlign: TextAlign.right,
                            //         textDirection: TextDirection.ltr,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          )
                        : Container(
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
                                    title: doc['docName'],
                                    color: AppColours.whiteColor),
                                VxRating(
                                  onRatingUpdate: (value) {},
                                  count: 5,
                                  isSelectable: false,
                                  value:
                                      double.parse(doc['docRating'].toString()),
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
                            Get.to(() => DoctorProfileView(doc: doc));
                          });
                  }),
            );
          }
        },
      ),
    );
  }
}
