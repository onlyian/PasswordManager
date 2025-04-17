import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login_screen/controllers/homescreen_controller.dart';
import 'package:login_screen/views/screens/Home.dart';
import 'package:login_screen/views/screens/Settings.dart';

import '../widgets/addPassSheet.dart';
import '../../utils/savePass.dart';



final HomeScreenController homeScreenController = Get.put(HomeScreenController());
final List<Widget> myScreens=[const Home(), const Settings()];

final TextEditingController websiteController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      bottomNavigationBar: Obx(() => Container(
        padding: EdgeInsets.all(5),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.all(Radius.circular(20),)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: GNav(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
              backgroundColor: Colors.grey.shade400,
              color: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.black87,
              gap: 8,
              tabs:
                [
                  GButton(
                    icon: Icons.vpn_key_outlined,
                    text: "Vault",
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: "Settings",
                  ),
                ],
              selectedIndex: homeScreenController.selectedScreenIndex.value,
              onTabChange: (index) =>homeScreenController.updateSelectedIndex(index),
            ),
          ),
        ),
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showPasswordBottomSheet(context, websiteController, usernameController, emailController, passwordController),
        backgroundColor:  Colors.grey[700],
        child: Icon(Icons.add, color: Color(0xFF212121),),
      ),

body: Obx(() {
    int index = homeScreenController.selectedScreenIndex.value;
    if (index >= 0 && index < myScreens.length) {
    return myScreens[index];
    } else {
    return Center(child: Text("Invalid Screen Index"));
    }
    }),
    );
  }
}

