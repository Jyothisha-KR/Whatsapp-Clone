import 'package:flutter/material.dart';
import 'package:whatsapp/calls/call_model.dart';

class CallTile extends StatelessWidget {
  CallTile({Key? key, required this.callData}) : super(key: key);
  CallModel callData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: (callData.avatar == '')
            ? AssetImage((callData.isGroup!)
                ? 'assets/images/group.png'
                : 'assets/images/profile.png')
            : NetworkImage(callData.avatar!) as ImageProvider,
      ),
      title: Text(callData.name.toString()),
      subtitle: Text(
          '${callData.date.toString()} , ${callData.updatedAt.toString()}'),
      trailing: (callData.callType == true)
          ? const Icon(Icons.call)
          : const Icon(Icons.video_call),
    );
  }
}
