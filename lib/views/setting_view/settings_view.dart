
import 'package:doctor_app/consts/consts.dart';
import 'package:doctor_app/consts/lists.dart';
import 'package:doctor_app/controllers/auth_controller.dart';
import 'package:doctor_app/controllers/settings_controller.dart';
import 'package:doctor_app/views/login_view/login_view.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: AppStyles.bold(
          title: AppStrings.settings,
          color: AppColours.whiteColor,
          size: AppSizes.size18,
        ),
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(AppAssets.imgSignUp),
                  ),
                  title: AppStyles.bold(title: controller.username.value),
                  subtitle: AppStyles.normal(title: controller.email.value),
                ),
                const Divider(
                  color: Colors.black54,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: List.generate(
                      settingsList.length,
                      (index) => ListTile(
                        onTap: () async {
                          if (index == 2) {
                            AuthController().signout();
                            Get.offAll(() => const LoginView());
                          }
                        },
                        leading: Icon(
                          settingsListIcon[index],
                          color: AppColours.blueColor,
                        ),
                        title: AppStyles.bold(title: settingsList[index]),
                      ),
                    ),
                  ),
                ),
              ],
            )),
    );
  }
}
