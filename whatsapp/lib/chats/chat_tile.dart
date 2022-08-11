import 'package:flutter/material.dart';
import 'package:whatsapp/chats/chat_details_screen.dart';
import 'package:whatsapp/chats/models/chat_model.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key, required this.chatData}) : super(key: key);
  final ChatModel chatData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatDetailsScreen(chatDetails: chatData),
            ));
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage:
          
          (chatData.avatar == '')? 
          AssetImage((chatData.isGroup!)
              ? 'assets/images/group.png'
              : 'assets/images/profile.png'):
          NetworkImage(chatData.avatar!) as ImageProvider
        
        ),
        title: Text(chatData.name!),
        subtitle: Text(chatData.message!),
        trailing: Text(chatData.updatedAt!),
      ),
    );
  }
}
