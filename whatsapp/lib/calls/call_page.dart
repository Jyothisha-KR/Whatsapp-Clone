import 'package:flutter/material.dart';
import 'package:whatsapp/calls/call_model.dart';
import 'package:whatsapp/calls/call_tile.dart';

class CallPage extends StatelessWidget {
  CallPage({Key? key}) : super(key: key);
  List<CallModel> CallList = [
    CallModel(
      avatar: 'https://static.toiimg.com/thumb/msid-23108797,width-800,height-600,resizemode-75/23108797.jpg',
      name: 'jyothisha',
      date: 'july 27',
      updatedAt: '10.00 am',
      isGroup: false,
      callType:true, 
    ),
    CallModel(
      avatar: 'https://image.winudf.com/v2/image1/Y29tLmJta3NzZXJ2aWNlcy5zYW1hbnRoYXdhbGxwYXBlcnNoZF9zY3JlZW5fM18xNTQxOTExMzk2XzA2Ng/screen-3.jpg?fakeurl=1&type=.jpg',
      name: 'thasni',
      date: 'july 27',
      updatedAt: '3.00 am',
      isGroup: false,
      callType:false 
    ),
    CallModel(
      avatar: 'https://www.tollywood.net/wp-content/uploads/2022/06/Lesser-and-Unknown-facts-about-Nayanthara.jpg',
      name: 'nourin',
      date: 'july 27',
      updatedAt: '11.00 am',
      isGroup: false,
      callType:true
    ),
    CallModel(
      avatar: 'https://images.tv9telugu.com/wp-content/uploads/2022/05/thamanna-5.jpg',
      name: 'asmi',
      date: 'july 27',
      updatedAt: '1.00 am',
      isGroup: false,
      callType:false 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: CallList.length,
        itemBuilder: (BuildContext context, int index) {
          return CallTile(
            callData: CallList[index],
          );
          
        },
      ),
      floatingActionButton:FloatingActionButton(onPressed: (){},
      child: const Icon(Icons.add_call,) ,
    ),);
  }
}

