import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lets_study/controller/meeting_history.dart';

class MeetingHistoryScreen extends StatelessWidget {
  const MeetingHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: History().meetingHistoryStream,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: ((context, index) => ListTile(
                    title: Text(
                        'Room Name: ${(snapshot.data! as dynamic).docs[index]['name']}'),
                    subtitle: Text(
              'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['date'].toDate())}',
            ),
                  )));
        }));
  }
}
