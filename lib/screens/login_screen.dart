import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lets_study/utils/colors.dart';
import 'package:lets_study/utils/constants.dart';
import 'package:lets_study/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft,
            //     colors: [
            //   Colors.indigo,
            //   Colors.teal,
            // ])
            image: DecorationImage(
          image: AssetImage("assets/images/class.png"),
          fit: BoxFit.cover,
        )),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Start or Join a Study Session",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Center(
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/study.png"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    CustomButton(
                      text: 'Google Sign In',
                      color: woodenColor,
                      onPressed: () {
                        authController.signInGoogle();
                      },
                    )
                  ],
                )),
          ),
        ));
  }
}
