import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../configs/constants.dart';
import '../widgets/mywidgets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Settings',
          style: TextStyle(fontFamily: 'Anurati'),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) =>
              Row(
                children: [
                  Image.asset(
                      "assets/images/user.png", height: 100, width: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kenya'),
                      Text("days,"),
                      Text("Room Type:")
                    ],
                  ),

                ],
              )
      ),
    );
  }
}