import 'package:flutter/material.dart';
import 'package:whatsapp/status/status_model.dart';

class StatusTile extends StatelessWidget {
   StatusTile({
    Key? key,
    required this.statusData
  }) : super(key: key);
  StatusModel statusData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
     leading:const CircleAvatar(
      child: Text('a'),
     ),
     title: Text(statusData.name.toString()),
         
        subtitle:  Text(statusData.updatedAt.toString()),
    );
  }
}