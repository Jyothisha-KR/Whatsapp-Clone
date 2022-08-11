import 'package:flutter/material.dart';
import 'package:whatsapp/status/status_model.dart';
import 'package:whatsapp/status/status_tile.dart';

class StatusPage extends StatelessWidget {
  StatusPage({Key? key}) : super(key: key);
  List<StatusModel> statusList = [
    StatusModel(
      avatar: '',
      name: 'text',
      updatedAt: '9.00 am',
    ),
    StatusModel(
      avatar: '',
      name: 'text2',
      updatedAt: '9.00 am',
    ),
    StatusModel(
      avatar: '',
      name: 'text3',
      updatedAt: '9.00 am',
    ),
    StatusModel(
      avatar: '',
      name: 'text4',
      updatedAt: '9.00 am',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ListTile(
            title: Text('My Status'),
            subtitle: Text('Tap to add status updates'),
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 500,
            child: ListView.builder(
              itemCount: statusList.length,
              itemBuilder: (BuildContext context, int index) {
                return StatusTile(
                  statusData: statusList[index],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      backgroundColor: const Color(0xFF075E50),
      child:const Icon(Icons.camera),),
    );
  }
}
