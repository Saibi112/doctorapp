import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/consts.dart';
import 'package:doctor_app/controllers/appointemnt_controller.dart';
import 'package:doctor_app/controllers/auth_controller.dart';
import 'package:doctor_app/views/Appointemnt_detail/appointment_detail_view.dart';
import 'package:get/get.dart';

class AppointmentView extends StatelessWidget {
  final bool isDoctor;

  // ignore: use_key_in_widget_constructors
  const AppointmentView({Key? key, this.isDoctor = false});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppoitemntController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: AppStyles.bold(
          title: "Appointments",
          color: AppColours.whiteColor,
          size: AppSizes.size18,
        ),
        actions: [
          IconButton(
              onPressed: () {
                AuthController().signout();
              },
              icon: const Icon(Icons.power_settings_new_rounded))
        ],
      ),
      body: FutureBuilder(
        future: controller.getAppoitemnt(isDoctor),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("ERROR CAUGHT"),
            );
          } else {
            var data = snapshot.data?.docs;
            //log(data.length.toString());
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Get.to(() => AppointmentDetailView(
                            doc: data[index],
                          ));
                    },
                    leading: CircleAvatar(
                      child: Image.asset(AppAssets.imgSignUp),
                    ),
                    title: AppStyles.bold(
                        title: data![index]
                            [!isDoctor ? 'appWithName' : 'appname']),
                    subtitle: AppStyles.normal(
                      title:
                          "${data[index]['appDay']}- ${data[index]['appTime']}",
                      color: AppColours.textColor.withOpacity(0.5),
                    ),
                  );
                },
                itemCount: data?.length ?? 0,
              ),
            );
          }
        },
      ),
    );
  }
}
