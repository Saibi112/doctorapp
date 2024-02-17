import 'package:doctor_app/consts/consts.dart';
import 'package:doctor_app/views/Appointemnt_view/appointemnet_view.dart';
import 'package:doctor_app/views/HomeView/home_view.dart';
import 'package:doctor_app/views/category_view/category_view.dart';

import 'package:doctor_app/views/setting_view/settings_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenList = [
    const HomeView(),
    const AppointmentView(),
    const CategoryView(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        mouseCursor: SystemMouseCursors.alias,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        //backgroundColor: AppColours.blueColor,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
        ),
        selectedIconTheme: const IconThemeData(color: Colors.amber),
        elevation: AppSizes.size18,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_add_outlined), label: "Appointemnets"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
