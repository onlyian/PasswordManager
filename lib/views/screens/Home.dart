import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_screen/utils/deleteAddress.dart';
import 'package:login_screen/utils/deletePass.dart';
import 'package:login_screen/views/screens/HomeScreen.dart';
import '../../configs/mycolors.dart';
import '../../controllers/TabChange_controller.dart';
import '../../controllers/address_controller.dart';
import '../../controllers/card_controller.dart';
import '../../controllers/password_controller.dart';
import '../../main.dart';
import '../../utils/deleteCard.dart';
import '../widgets/CategoryCard.dart';
import 'DataViews/InfoScreenA.dart';
import 'DataViews/InfoScreenC.dart';
import 'DataViews/InfoScreenP.dart';




class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PasswordController passwordController = Get.put(PasswordController());
  final AddressController addressController = Get.put(AddressController());
  final CardController cardController = Get.put(CardController());


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    passwordController.fetchPasswords();
    addressController.fetchAddresses();
    cardController.fetchCards();

  final TabChangeController tabController = Get.find<TabChangeController>();

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        tabController.updateTabIndex(_tabController.index);

        print("Tab Changed To: ${_tabController.index}");
      }
    });

  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color _getIndicatorColor() {
    int tabIndex = tabController.selectedTabIndex.value;
    switch (tabIndex) {
      case 0:
        return darkBlue;
      case 1:
        return darkGreen;
      case 2:
        return darkRed;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final login = GetStorage();
    final dynamic username = login.read("username") ?? " ";
    const String assetName = 'assets/images/shield.svg';
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;


      return Obx(() =>DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                                // Header
                            SizedBox(height: screenHeight * 0.05,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5, 15.0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // profile row
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundColor: const Color.fromARGB(
                                      255, 213, 213, 213),
                                  child: CircleAvatar(
                                    radius: 26.5,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: CircleAvatar(
                                        backgroundImage: const AssetImage(
                                            "assets/images/img_1.png"),
                                        radius: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                 Padding(
                                  padding: EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hello $username",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 22, 22, 22),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "Welcome back !",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 39, 39, 39),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                              icon: SvgPicture.asset(assetName,
                                  height: screenHeight * 0.035),
                              onPressed: () {
                                Get.offAndToNamed("/login");
                                Get.snackbar("Logout", "Logged out successfully",colorText: Colors.white);
                              }
                            ),
                          ],
                        ),
                      ),

                      // Category label
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 10, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Category",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight
                                .bold),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),

                      // Category Tabs
                      TabBar(
                        controller: _tabController,
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                        indicatorPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                        dividerColor: Colors.transparent,
                        indicatorColor: _getIndicatorColor(),
                        tabs: [
                          Tab(
                            height: 135,
                            child:
                            CategoryCard(
                              color: lightBlue,
                              iconBg: darkBlue,
                              icon: "assets/images/codesandbox.svg",
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                          ),
                          Tab(
                            height: 135,
                            child:
                            CategoryCard(
                              color: lightGreen,
                              iconBg: darkGreen,
                              icon: "assets/images/compass.svg",
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                          ),
                          Tab(
                            height: 135,
                            child:
                            CategoryCard(
                              color: lightRed,
                              iconBg: darkRed,
                              icon: "assets/images/credit-card.svg",
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 5),
                    ],
                  ),
                ),

                // Expanded TabBarView
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      CategoryViewP("Passwords"),
                      CategoryViewA("Addresses"),
                      CategoryViewC("Cards"),
                    ],
                  ),
                ),
              ],
            ),

        ),
      ));
    }

  Widget CategoryViewP(String label) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            color: Colors.white,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                label,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: passwordController.passwords.length,
                itemBuilder: (context, index) {
                  final pass = passwordController.passwords[index];
                  return  Padding(
                    padding: const EdgeInsets.all(5.0),
                   child:  ListTile(
                          tileColor: Colors.cyan[100],
                          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),),
                          splashColor: Colors.cyan,
                          onLongPress:  ()async {
                            final confirmed = await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Password?"),
                                content: Text("Are you sure you want to delete this password?"),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context, false), child: Text("Cancel")),
                                  TextButton(onPressed: () => Navigator.pop(context, true), child: Text("Delete")),
                                ],
                              ),
                            );

                            if (confirmed == true) {
                              final success = await deletePass(pass.id);
                              if (success) {
                                passwordController.fetchPasswords(); // Refresh the list
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password deleted.")));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to delete Password.")));
                              }
                            }
                          },

                          leading: Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: logoBackground,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: FractionallySizedBox(
                              heightFactor: 0.5,
                              widthFactor: 0.5,
                              child: Icon(Icons.lock),
                            ),
                          ),
                          title: Text(
                            pass.website,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle:  Text(
                            pass.email,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 39, 39, 39),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed:() => Get.to(() => PasswordInfoScreen(password: pass)),

                            icon: Image.asset(
                              "assets/images/extras.png",
                              height: screenHeight * 0.020,
                            ),
                          ),
                        ),
                  );
                },
              ),
          ),
          const SizedBox(height: 5,)
        ],
      ),
    );
  }
  Widget CategoryViewA(String label) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            color: Colors.white,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                label,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: addressController.addresses.length,
                itemBuilder: (context, index) {
                  final address = addressController.addresses[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      tileColor: Colors.tealAccent[100],
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),),
                      splashColor: Colors.cyan,
                      onLongPress:  ()async {
                        final confirmed = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Delete Address?"),
                            content: Text("Are you sure you want to delete this address?"),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context, false), child: Text("Cancel")),
                              TextButton(onPressed: () => Navigator.pop(context, true), child: Text("Delete")),
                            ],
                          ),
                        );

                        if (confirmed == true) {
                          final success = await deleteAddress(address.id); // Replace with your actual model
                          if (success) {
                            addressController.fetchAddresses(); // Refresh the list
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Address deleted.")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to delete address.")));
                          }
                        }
                      },

                      leading: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: logoBackground,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: FractionallySizedBox(
                          heightFactor: 0.5,
                          widthFactor: 0.5,
                          child: Icon(Icons.location_on_rounded),
                        ),
                      ),
                      title: Text(
                        address.region,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle:  Text(
                        address.city,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 39, 39, 39),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed:() => Get.to(() => AddressInfoScreen(address: address)),
                        icon: Image.asset(
                          "assets/images/extras.png",
                          height: screenHeight * 0.020,
                        ),
                      ),

                    ),
                  );
                },
              ),
          ),
          const SizedBox(height: 5,)
        ],
      ),
    );
  }
  Widget CategoryViewC(String label) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            color: Colors.white,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                label,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: cardController.cards.length,
                itemBuilder: (context, index) {
                  final card = cardController.cards[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      tileColor: Colors.redAccent[100],
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),),
                      splashColor: Colors.cyan,
                      onLongPress:  ()async {
                        final confirmed = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                          title: Text("Delete Card?"),
                          content: Text("Are you sure you want to delete this card?"),
                          actions: [
                        TextButton(onPressed: () => Navigator.pop(context, false), child: Text("Cancel")),
                        TextButton(onPressed: () => Navigator.pop(context, true), child: Text("Delete")),
                        ],
                        ),
                        );

                        if (confirmed == true) {
                        final success = await deleteCard(card.id); // Replace with your actual model
                        if (success) {
                        cardController.fetchCards(); // Refresh the list
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Card deleted.")));
                        } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to delete card.")));
                        }
                        }
                        },

                      leading: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: logoBackground,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: FractionallySizedBox(
                          heightFactor: 0.5,
                          widthFactor: 0.5,
                          child: Icon(Icons.credit_card_rounded),
                        ),
                      ),
                      title: Text(
                        card.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle:  Text(
                        card.brand,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 39, 39, 39),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => Get.to(() => CardInfoScreen(card: card)),
                        icon: Image.asset(
                          "assets/images/extras.png",
                          height: screenHeight * 0.020,
                        ),
                      ),

                    ),
                  );
                },
              ),
          ),
          const SizedBox(height: 5,)
        ],
      ),
    );
  }
  }





