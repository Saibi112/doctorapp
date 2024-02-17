import 'package:doctor_app/consts/lists.dart';
import 'package:doctor_app/views/Category_Details/category_details_view.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: AppStyles.bold(
            title: AppStrings.category,
            size: AppSizes.size18,
            color: AppColours.whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 175,
            ),
            itemCount: iconsList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => CategoryDetailsView(catName:iconsTitleList[index] ,));
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          iconsList[index],
                          width: 60,
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      10.heightBox,
                      AppStyles.bold(
                          title: iconsTitleList[index],
                          color: AppColours.textColor,
                          size: AppSizes.size18,
                          alignment: TextAlign.left),
                      10.heightBox,
                      AppStyles.bold(
                          title: "13 Specialist",
                          color: AppColours.whiteColor,
                          size: AppSizes.size18),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
