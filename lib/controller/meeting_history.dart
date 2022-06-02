import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_study/utils/constants.dart';

class History {
  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingHistoryStream => firestore
      .collection('users')
      .doc(firebaseAuth.currentUser!.uid)
      .collection('meetings')
      .snapshots();

  void addToMeetingHistory(String meetingName) async {
    try {
      await firestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('meetings')
          .add({
        'name': meetingName,
        'date': DateTime.now(),
      });
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }
}
