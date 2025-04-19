import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/switch_controller.dart';

final switchController = Get.put(SwitchController());

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){},
            icon: Icon(Icons.arrow_back_rounded)),

        title: Text('Settings',
          style: TextStyle(fontFamily: 'Anurati'),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),

      body: Column(
               children: [
                 ListTile(
                   leading: Icon(Icons.fingerprint),
                   title: Text("Require biometric",style: TextStyle(fontWeight: FontWeight.w500),),
                   subtitle: Padding( padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                       child:  Text("Use biometric authentication to access sensitive information")),
                   trailing: Obx(() => Switch(
                     value: switchController.isSwitched.value,
                     onChanged: (value) => switchController.toggleSwitch(value),
                   )),
                 ),
                 ListTile(
                   leading: Icon(Icons.brush_rounded),
                   title: Text("Theme",style: TextStyle(fontWeight: FontWeight.w500),),
                   subtitle: Text("Toggle app theme"),
                   trailing: Obx(() => Switch(
                     value: switchController.isSwitched2.value,
                     onChanged: (value) => switchController.toggleSwitch2(value),
                   )),
                 ),

               ],
             ),

    );
  }
}