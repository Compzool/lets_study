import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lets_study/controller/jetsi_meeting_controller.dart';
import 'package:lets_study/utils/colors.dart';
import 'package:lets_study/utils/constants.dart';
import 'package:lets_study/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController _roomController;
  late TextEditingController _nameController;
  JitsMeetingController _jitsMeetingController = Get.find();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    // TODO: implement initState
    _roomController = TextEditingController();
    _nameController =
        TextEditingController(text: authController.user!.displayName);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roomController.dispose();
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  _joinMeeting() {
    _jitsMeetingController.createMeeting(
        roomName: _roomController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        name: _nameController.text);
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text("Study Session", style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: _roomController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Room ID",
                  contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: _nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Name",
                  contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 8)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Join",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MeetingOption(
            text: "Mute Audio",
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          MeetingOption(
            text: "Close Camera?",
            isMute: isVideoMuted,
            onChange: onAudioMuted,
          )
        ],
      ),
    );
  }
}
