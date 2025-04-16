import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../configs/constants.dart';
import '../../configs/mycolors.dart';
import '../widgets/CategoryCard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync:  this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color _getIndicatorColor() {
    switch (_selectedIndex) {
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
    const String assetName = 'assets/images/shield.svg';
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20, 20.0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // profile row
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: const Color.fromARGB(255, 213, 213, 213),
                          child: CircleAvatar(
                            radius: 26.5,
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: CircleAvatar(
                                backgroundImage: const AssetImage("assets/images/img_1.png"),
                                radius: 25,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 22, 22, 22),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Welcome back!",
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
                      icon: SvgPicture.asset(assetName, height: screenHeight * 0.035),
                      onPressed: () => Get.offAndToNamed("/login"),
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 5),
                child: SearchBar(
                  backgroundColor: WidgetStateProperty.all(const Color.fromARGB(247, 232, 235, 237)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  leading: const Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 0),
                    child: Icon(Icons.search),
                  ),
                  hintText: "Search Password",
                  textStyle: WidgetStateProperty.all(
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700]),
                  ),
                ),
              ),

              // Category label
              const Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Category",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Category Tabs

                      TabBar(
                        // isScrollable: true,
                        controller: _tabController,
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                        indicatorPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                        dividerColor: Colors.transparent,
                    indicatorColor: _getIndicatorColor(),
                      tabs:[
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

              const SizedBox(height: 10),

              // Expanded TabBarView
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    buildCategoryList("Passwords"),
                    buildCategoryList("Addresses"),
                    buildCategoryList("Cards"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget buildCategoryList(String label) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              label,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: Constants.passwordData.length,
              itemBuilder: (context, index) {
                final password = Constants.passwordData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: logoBackground,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: FractionallySizedBox(
                              heightFactor: 0.5,
                              widthFactor: 0.5,
                              child: Image.network(password.logoUrl),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  password.websiteName,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  password.email,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 39, 39, 39),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/extras.png",
                          height: screenHeight * 0.020,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
