import 'package:get/get.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lets_study/controller/meeting_history.dart';
import 'package:lets_study/utils/constants.dart';

class JitsMeetingController extends GetxController {
  final currentUser = authController.user!;
  final History _meetingHistory = History();
  void createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String name = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String? username = name.isEmpty ? currentUser.displayName : name;
      var options = JitsiMeetingOptions(room: roomName)
        ..subject = "Meeting with ${username}"
        ..userDisplayName = username
        ..userEmail = currentUser.email
        ..userAvatarURL = currentUser.photoURL // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      _meetingHistory.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options,listener: JitsiMeetingListener());
    } catch (error) {
      print("error: $error");
    }
  }
}
