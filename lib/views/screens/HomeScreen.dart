import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login_screen/controllers/homescreen_controller.dart';
import 'package:login_screen/views/screens/Home.dart';
import 'package:login_screen/views/screens/Settings.dart';
import '../../controllers/TabChange_controller.dart';
import '../widgets/addAddressSheet.dart';
import '../widgets/addCardSheet.dart';
import '../widgets/addPassSheet.dart';



final TabChangeController tabController = Get.put(TabChangeController(),permanent: true);
final HomeScreenController homeScreenController = Get.put(HomeScreenController());
final List<Widget> myScreens=[const Home(), const Settings()];

//password controllers
final TextEditingController websiteController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
//address controllers
final TextEditingController nameController = TextEditingController();
final TextEditingController orgController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController regionController = TextEditingController();
final TextEditingController streetController = TextEditingController();
final TextEditingController cityController = TextEditingController();
final TextEditingController postalController = TextEditingController();
// Card controllers
final TextEditingController cardNameController = TextEditingController();
final TextEditingController cardholderController = TextEditingController();
final TextEditingController cardNumberController = TextEditingController();
final TextEditingController brandController = TextEditingController();
final TextEditingController expiryMonthController = TextEditingController();
final TextEditingController expiryYearController = TextEditingController();
final TextEditingController cvvController = TextEditingController();


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

      floatingActionButton: Obx(() {
        final int tabIndex = tabController.selectedTabIndex.value;
        if(homeScreenController.selectedScreenIndex.value == 0){
        return FloatingActionButton(
          onPressed: () {
            if (tabIndex == 0) {
              // Show custom password bottom sheet
              showPasswordBottomSheet(
                context,
                websiteController,
                usernameController,
                emailController,
                passwordController,
              );
            }
            else if (tabIndex == 1) {
              showAddressBottomSheet(
                context,
                nameController,
                orgController,
                phoneController,
                regionController,
                streetController,
                cityController,
                postalController,
              );
            }else {
            showCardBottomSheet(
            context,
            cardNameController,
            cardholderController,
            cardNumberController,
            brandController,
            expiryMonthController,
            expiryYearController,
            cvvController,
            );
            }
          },
          backgroundColor: Colors.cyan[200],
          child: Icon(Icons.add, color: Colors.black54),
        );
        }
        else {
          // Don't show FAB on Settings
          return const SizedBox.shrink();
        }
      }),


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
