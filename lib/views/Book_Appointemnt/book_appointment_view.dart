import 'package:doctor_app/consts/consts.dart';
import 'package:doctor_app/controllers/appointemnt_controller.dart';
import 'package:doctor_app/res/components/custom_button.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:get/get.dart';

class BookAppointmentView extends StatelessWidget {
  final String docId;
  final String docName;
  const BookAppointmentView(
      {super.key, required this.docId, required this.docName});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppoitemntController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppStyles.bold(
            title: docName,
            color: AppColours.whiteColor,
            size: AppSizes.size18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.bold(
                title: "Select  Appointement Day",
              ),
              5.heightBox,
              CustomTextField(
                hint: "Select Day",
                textEditingController: controller.apptDayController,
              ),
              10.heightBox,
              AppStyles.bold(title: "Select  Appointement Time AM-PM"),
              5.heightBox,
              CustomTextField(
                hint: "Select time",
                textEditingController: controller.appTimeController,
              ),
              20.heightBox,
              AppStyles.bold(title: "Phone Number:"),
              5.heightBox,
              CustomTextField(
                hint: "Enter Mobile Number",
                textEditingController: controller.appMobileController,
              ),
              10.heightBox,
              AppStyles.bold(title: "Full Name:"),
              5.heightBox,
              CustomTextField(
                hint: "Enter Your Name",
                textEditingController: controller.appNameController,
              ),
              5.heightBox,
              10.heightBox,
              AppStyles.bold(title: "Message:"),
              CustomTextField(
                hint: "Enter Your Message",
                textEditingController: controller.appMessageController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10),
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  onTap: () async {
                    // Get.to(() => const BookAppointmentView());
                    await controller.bookAppoitemnt(docId, docName, context);
                    Get.back();
                  },
                  buttonText: "Book An Oppointemnet",
                ),
        ),
      ),
    );
  }
}
