import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_screen/utils/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(GetMaterialApp(

    // home: Login()
    getPages: routes,
    initialRoute: "/login",
    debugShowCheckedModeBanner: false,
  ));
}



