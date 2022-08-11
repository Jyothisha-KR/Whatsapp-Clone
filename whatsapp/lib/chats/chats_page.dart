import 'package:flutter/material.dart';
import 'package:whatsapp/chats/chat_tile.dart';
import 'package:whatsapp/chats/models/chat_model.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  List<ChatModel> chatList = [
    ChatModel(
      avatar: 'https://static.toiimg.com/thumb/msid-23108797,width-800,height-600,resizemode-75/23108797.jpg',
      isGroup: false,
      message: 'hello',
      name: 'jyothisha',
      updatedAt: '9.00 am',
    ),
    ChatModel(
      avatar: 'https://images.tv9telugu.com/wp-content/uploads/2022/05/thamanna-5.jpg',
      isGroup: false,
      message: 'Hiiii',
      name: 'asmi',
      updatedAt: '7.00 am',
    ),
    ChatModel(
      avatar: 'https://qph.cf2.quoracdn.net/main-qimg-0d52f205f5295fbbf0df97b5f27ca0bf-lq',
      isGroup: true,
      message: 'hello',
      name: 'baabtra',
      updatedAt: '9.00 am',
    ),
    ChatModel(
      avatar: 'https://media.istockphoto.com/photos/multiracial-group-of-young-people-standing-in-circle-and-smiling-at-picture-id1319947526?b=1&k=20&m=1319947526&s=170667a&w=0&h=o8mdog0xAEcBVsBnN_7PAexLqS7Q_pfybeBGx-TaB54=',
      isGroup: true,
      message: 'koooi',
      name: 'baabtra2',
      updatedAt: '9.00 am',
    ),
      ChatModel(
        avatar: 'https://image.winudf.com/v2/image1/Y29tLmJta3NzZXJ2aWNlcy5zYW1hbnRoYXdhbGxwYXBlcnNoZF9zY3JlZW5fM18xNTQxOTExMzk2XzA2Ng/screen-3.jpg?fakeurl=1&type=.jpg',
      isGroup: false,
      message: 'dee',
      name: 'thasni',
      updatedAt: '5.00 am',
      ),
      ChatModel(avatar: 'https://www.tollywood.net/wp-content/uploads/2022/06/Lesser-and-Unknown-facts-about-Nayanthara.jpg',
      isGroup: false,
      message: 'oooy',
      name: 'nourin',
      updatedAt: '2.00 am',
      ),
      ChatModel(avatar: 'https://filmfare.wwmindia.com/content/2016/Jul/14_1469712507.jpg',
      isGroup: false,
      message: 'daaaa',
      name: 'roshan',
      updatedAt: '2.00 am',),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          
          return  ChatTile(
            chatData: chatList[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF075E50),
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
    );
  }
}
