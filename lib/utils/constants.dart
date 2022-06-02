import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lets_study/controller/auth_controller.dart';
import 'package:lets_study/screens/home_screen.dart';
import 'package:lets_study/screens/meeting_history_screen.dart';
import 'package:lets_study/screens/meeting_screen.dart';

//FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;
GoogleSignIn googleSignIn = GoogleSignIn();
//CONTROLLERS
var authController = AuthController.instance;


//Pages

List pages = [
  MeetingScreen(),
  MeetingHistoryScreen(),
  Text("Contacts"),
  Center(child: Text("Settings")),
];