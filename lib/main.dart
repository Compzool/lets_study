import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_study/controller/auth_controller.dart';
import 'package:lets_study/screens/home_screen.dart';
import 'package:lets_study/screens/login_screen.dart';
import 'package:lets_study/screens/meeting_screen.dart';
import 'package:lets_study/screens/videocall_screen.dart';
import 'package:lets_study/utils/colors.dart';
import 'package:lets_study/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let\'s Study',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'ios',
            ),
        primaryTextTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'ios',
            ),
      ),
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/meeting', page: () => MeetingScreen()),
        GetPage(name:'/videoCall', page: () => VideoCallScreen()),
      ],
      initialRoute: '/',
    );
  }
}
