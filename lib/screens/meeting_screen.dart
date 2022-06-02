import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_study/controller/jetsi_meeting_controller.dart';
import 'package:lets_study/widgets/meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);
  JitsMeetingController _jitsMeetingController = Get.put(JitsMeetingController());

  createNewMeeting() async {
    var random = Random();
    String roomName = "room-${(random.nextInt(10000000) + 10000000)}";
    _jitsMeetingController.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  joinScreen() {
    Get.toNamed("/videoCall");
  }

  @override
  Widget build(BuildContext context) {
 
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MeetingButton(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: 'Create Meeting',
            ),
            MeetingButton(
              onPressed: joinScreen,
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
            ),
            MeetingButton(
              onPressed: () {},
              icon: Icons.calendar_today,
              text: 'Schedule Meeting',
            ),
            MeetingButton(
              onPressed: () {},
              icon: Icons.arrow_upward_rounded,
              text: 'Share Screen',
            )
          ],
        ),
        Expanded(
            child: Center(
                child: Text(
          'Create or join a meeting',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ))),
      ],
    );
  }
}
