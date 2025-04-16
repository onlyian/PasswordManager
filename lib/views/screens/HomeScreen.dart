import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login_screen/controllers/homescreen_controller.dart';
import 'package:login_screen/views/screens/Home.dart';
import 'package:login_screen/views/screens/Settings.dart';


final HomeScreenController homeScreenController = Get.put(HomeScreenController());
final List<Widget> myScreens=[const Home(), const Settings()];

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
            color: Color(0xFF303030),
            borderRadius: BorderRadius.all(Radius.circular(20),)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 5),
            child: GNav(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
              backgroundColor: Color(0xFF303030),
              color: Colors.white60,
              activeColor: Color(0xFF64FFDA),
              tabBackgroundColor: Color(0xFF212121),
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
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
              context: context,
              builder: (context){
                return Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.6,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                 Center(
                   child: ElevatedButton(
                       onPressed: (){Navigator.pop(context);},
                       child: Text("Close")),
                 ),
                    ],
                  ),
                );
              },
          );

        },
        // onPressed: ()=> bottomModal(context),
        backgroundColor:  Color(0xFF64FFDA),
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
