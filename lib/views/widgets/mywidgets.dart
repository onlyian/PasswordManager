import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../configs/constants.dart';
import '../../configs/mycolors.dart';
import '../../models/AddModal.dart';
import '../../models/CategoryContainer.dart';
import '../../models/password_model.dart';

Widget PasswordTile(passwords password, BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 10, 10.0, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // profile row
        Row(
          children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
            color: logoBackground,
            borderRadius: BorderRadius.circular(20)),
             child: FractionallySizedBox(
            heightFactor: 0.5,
            widthFactor: 0.5,
            child: Image.network(password.logoUrl))),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    password.websiteName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    password.email,
                    style: TextStyle(
                      color: Color.fromARGB(255, 39, 39, 39),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        IconButton(
          onPressed: (){},
          icon: Image.asset("assets/images/cont.png",
             height: screenHeight * 0.030),)

      ],
    ),
  );
}

Widget LogoBox(passwords password, BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          color: logoBackground,
          borderRadius: BorderRadius.circular(20)),
      child: FractionallySizedBox(
          heightFactor: 0.5,
          widthFactor: 0.5,
          child: Image.network(password.logoUrl)));
}

Widget HeadingText(String text) {
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10, 0, 0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget CategoryBoxes() {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [

    CategoryBox(
        outerColor: lightBlue,
        innerColor: darkBlue,
        logoAsset: "assets/images/codesandbox.svg"),
    CategoryBox(
        outerColor: lightGreen,
        innerColor: darkGreen,
        logoAsset: "assets/images/compass.svg"),
    CategoryBox(
        outerColor: lightRed,
        innerColor: darkRed,
        logoAsset: "assets/images/credit-card.svg")
  ]);
}

Widget circleAvatarRound() {
  return CircleAvatar(
    radius: 28,
    backgroundColor: Color.fromARGB(255, 213, 213, 213),
    child: CircleAvatar(
      radius: 26.5,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/img_1.png"),
          radius: 25,
        ),
      ),
    ),
  );
}

Widget profilePicAndBellIcon(String assetName, double screenHeight) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 35, 20.0, 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // profile row
        Row(
          children: [
            circleAvatarRound(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
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
          icon: SvgPicture.asset(assetName,
               height: screenHeight * 0.035),
          onPressed: () => Get.offAndToNamed("/login"),
        ),
      ],
    ),
  );
}

Widget searchText(String hintText) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
                20, 5, 5, 5), // add padding to adjust icon
            child: Icon(
              Icons.search,
              color: searchGrey,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(16),
          hintText: hintText,
          hintStyle: TextStyle(
              color: searchGrey, fontWeight: FontWeight.w500),
          fillColor: Color.fromARGB(247, 232, 235, 237),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(20))),
      // style: TextStyle(),
    ),
  );
}

Future<dynamic> bottomModal(BuildContext context) {
  return showModalBottomSheet(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(20.0),
      // ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
            children: <Widget>[
          Container(
            child: Container(
              decoration: new BoxDecoration(
                  color: Colors.white, //forDialog ? Color(0xFF737373) : Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0))),
              child: AddModal(),
            ),
          )
        ]);
      });
}

Widget bottomSheetWidgets(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: screenWidth * 0.4,
            height: 5,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 156, 156, 156),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        searchText("Search for a website or app"),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              height: 60,
              width: 130,
              decoration: BoxDecoration(
                  color: logoBackground,
                  borderRadius: BorderRadius.circular(20)),
              child: FractionallySizedBox(
                heightFactor: 0.5,
                widthFactor: 0.5,
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Add",
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}