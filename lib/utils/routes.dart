
import 'package:get/get.dart';
import 'package:login_screen/views/screens/HomeScreen.dart';
import 'package:login_screen/views/screens/LoginPage.dart';
import 'package:login_screen/views/screens/SignupPage.dart';


List<GetPage> routes = [

  GetPage(name: "/login", page: ()=> Login() ),
  GetPage(name: "/signup", page: ()=>SignupPage() ),
  GetPage(name: "/home", page: ()=>HomeScreen() ),
];