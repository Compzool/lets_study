import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lets_study/screens/login_screen.dart';
import 'package:lets_study/utils/constants.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  //Initialize user
  late Rx<User?> _user;
  //late Rx<GoogleSignInAccount?> _googleUser;
  //Get User
  User? get user => _user.value;


  //GoogleSignInAccount? get googleUser => _googleUser.value;

  @override
  void onReady() {
    // TODO: implement onReady
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
    // _googleUser = Rx<GoogleSignInAccount?>(googleSignIn.currentUser);
    // _googleUser.bindStream(googleSignIn.onCurrentUserChanged);
    // ever(_googleUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed("/");
    } else {
      Get.offNamed("/home");
    }
  }

  //Sign in with Google
  signInGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );

      User? user = userCredential.user;


      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await firestore.collection('users').doc(user.uid).set({
            'name': user.displayName,
            'email': user.email,
            'photoUrl': user.photoURL,
            'lastSeen': DateTime.now(),
            'uid': user.uid,
          });
        } else {
          await firestore.collection('users').doc(user.uid).update({
            'lastSeen': DateTime.now(),
          });
        }
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Signing In", e.message.toString());
    }
  }

  void logout() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}
