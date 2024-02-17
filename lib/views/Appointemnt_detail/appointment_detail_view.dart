import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/consts.dart';

class AppointmentDetailView extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppointmentDetailView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: AppStyles.bold(
              title: doc['appWithName'],
              color: AppColours.whiteColor,
              size: AppSizes.size18)),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.bold(title: "Select  Appointement Day"),
              5.heightBox,
              AppStyles.normal(
                title: doc['appWithName'],
              ),
              10.heightBox,
              AppStyles.bold(title: "Selected Appointement Time"),
              5.heightBox,
              AppStyles.normal(
                title: doc['appTime'],
              ),
              20.heightBox,
              AppStyles.bold(title: "Mobile Number"),
              5.heightBox,
              AppStyles.normal(
                title: doc['appMobile'],
              ),
              10.heightBox,
              AppStyles.bold(title: "Full Name"),
              5.heightBox,
              AppStyles.normal(
                title: doc['appWithName'],
              ),
              5.heightBox,
              10.heightBox,
              AppStyles.bold(title: "Message"),
              5.heightBox,
              AppStyles.normal(
                title: doc['appMessage'],
              ),
            ],
          )),
    );
  }
}
