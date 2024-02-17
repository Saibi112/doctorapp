import 'package:doctor_app/consts/consts.dart';
import 'package:doctor_app/res/components/waiting_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

// Import the Firebase options file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: Appfonts.nunito),
      debugShowCheckedModeBanner: false,
      home: const WaitingScreen(),
    );
  }
}
