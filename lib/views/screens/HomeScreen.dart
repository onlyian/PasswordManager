
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/controllers/homescreen_controller.dart';
import 'package:login_screen/views/screens/Home.dart';
import 'package:login_screen/views/screens/Settings.dart';
import '../widgets/mywidgets.dart';

final HomeScreenController homeScreenController = Get.put(HomeScreenController());
final List<Widget> myScreens=[const Home(),const Settings()];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      bottomNavigationBar: Obx(() => BottomNavigationBar(

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.vpn_key_outlined),label: "Vault"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
          ],
        showUnselectedLabels: true,
        backgroundColor: Color.fromARGB(255, 231, 249, 242),
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.black,
        currentIndex: homeScreenController.selectedScreenIndex.value,
        onTap: (p)=> homeScreenController.updateSelectedIndex(p),
      )
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
        backgroundColor: Colors.cyan[200],
        child: Icon(Icons.add, color: Colors.black54,),
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
