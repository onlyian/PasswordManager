import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login_screen/configs/mycolors.dart';
import 'package:login_screen/controllers/homescreen_controller.dart';
import 'package:login_screen/views/screens/Home.dart';
import 'package:login_screen/views/screens/Settings.dart';

import '../../utils/savePass.dart';
import '../widgets/mywidgets.dart';


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
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
              context: context,
              builder: (context){
                return Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.65,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: 5,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 156, 156, 156),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(height: 10),

                        Text("   Enter Logins   ",
                          style:TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 20),),

                    Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                      child: Text(
                        "Website",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: websiteController,
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  20, 5, 5, 5), // add padding to adjust icon
                              child: Icon(
                                Icons.web,
                                color: searchGrey,
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(16),
                            hintText: "Enter Website",
                            hintStyle: TextStyle(
                                color: searchGrey, fontWeight: FontWeight.w500),
                            fillColor: Color.fromARGB(247, 232, 235, 237),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                                borderRadius: BorderRadius.circular(20))),

                      ),
                    ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                          child: Text(
                            "Username",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: usernameController,
                decoration: InputDecoration(
                prefixIcon: Padding(
                padding: EdgeInsets.fromLTRB(
                20, 5, 5, 5), // add padding to adjust icon
                child: Icon(
                  Icons.person,
                color: searchGrey,
                ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                hintText: "Enter Username",
                hintStyle: TextStyle(
                color: searchGrey, fontWeight: FontWeight.w500),
                fillColor: Color.fromARGB(247, 232, 235, 237),
                border: OutlineInputBorder(
                borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(20))),

                ),
                ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                          child: Text(
                            "Email",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: emailController,
                decoration: InputDecoration(
                prefixIcon: Padding(
                padding: EdgeInsets.fromLTRB(
                20, 5, 5, 5), // add padding to adjust icon
                child: Icon(
                  Icons.email,
                color: searchGrey,),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                hintText: "Enter Email",
                hintStyle: TextStyle(
                color: searchGrey, fontWeight: FontWeight.w500),
                fillColor: Color.fromARGB(247, 232, 235, 237),
                border: OutlineInputBorder(
                borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(20))),

                ),
                ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                          child: Text(
                            "Password",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                decoration: InputDecoration(
                prefixIcon: Padding(
                padding: EdgeInsets.fromLTRB(
                20, 5, 5, 5), // add padding to adjust icon
                child: Icon(
                  Icons.lock_outline,
                color: searchGrey,
                ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                hintText: "Enter Password",
                hintStyle: TextStyle(
                color: searchGrey, fontWeight: FontWeight.w500),
                fillColor: Color.fromARGB(247, 232, 235, 237),
                border: OutlineInputBorder(
                borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.circular(20))),

                ),
                ),
                      SizedBox(height: 30),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.grey, // Background color
                           foregroundColor: Colors.white, // Text color
                         ),
                           onPressed: (){Navigator.pop(context);},
                           child: Text("Cancel",style: TextStyle(fontSize: 15,),)
                     ),
                     SizedBox(width: 10,),
                     ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.cyan, // Background color
                           foregroundColor: Colors.black, // Text color
                         ),
                       child: Text("  Save  ",style: TextStyle(fontSize: 15,),),
                         onPressed:  () async{
                           String website= websiteController.text.trim();
                           String username= usernameController.text.trim();
                           String  email= emailController.text.trim();
                           String password= passwordController.text.trim();

                            bool isRetrieved = await insertPassword(website, username, email,password);

                              if (isRetrieved == true) {
                                if (context.mounted) {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Save successful!")),
                                      );
                                      }
                                      websiteController.clear();
                                      usernameController.clear();
                                      emailController.clear();
                                      passwordController.clear();
                                      } else {
                                      if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Save failed. Try again.")),
                                      );
                                      }
                                      }

                              },

                     ),
                   ],
                   ),
                    ],
                  ),
                );
              },
          );

        },
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

