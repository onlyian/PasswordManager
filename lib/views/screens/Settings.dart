import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:local_auth/local_auth.dart';
import '../../controllers/switch_controller.dart';


final switchController = Get.put(SwitchController());


class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings',
          style: TextStyle(fontFamily: 'Anurati',fontSize: 20,color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),

      body: Column(
               children: [
                 SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: ListTile(
                     tileColor: Colors.blueGrey[100],
                     shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20),),
                     leading: Icon(Icons.fingerprint),
                     title: Text("Require biometric",style: TextStyle(fontWeight: FontWeight.w500),),
                     subtitle: Padding( padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                         child:  Text("Use biometric authentication to access sensitive information")),
                     trailing: Obx(() => Switch(
                       value: switchController.isSwitched.value,
                       onChanged: (value) => switchController.toggleSwitch(value),
                     )),
                   ),
                 ),
               ],
             ),

    );
  }
}

Future<bool> BiometricPassed() async {
  if (!switchController.isSwitched.value) return true;

  final auth = LocalAuthentication();
  bool canCheckBiometrics = await auth.canCheckBiometrics;
  if (!canCheckBiometrics) {
    Get.snackbar('Error', 'Biometric not available');
    return false;
  }

  try {
    final isAuthenticated = await auth.authenticate(
      localizedReason: 'Please authenticate',
      options: const AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: true,
      ),
    );

    if (!isAuthenticated) {
      Get.snackbar('Cancelled', 'Authentication was cancelled');
    }

    return isAuthenticated;
  }
  catch (e) {
    Get.snackbar('Error', 'Biometric failed: $e');
    return false;
  }
}
