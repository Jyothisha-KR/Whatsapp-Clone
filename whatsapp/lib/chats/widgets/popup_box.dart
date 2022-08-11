import 'package:flutter/material.dart';

class PopupBox extends StatelessWidget {
  const PopupBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWidget(
                      icon: const Icon(Icons.insert_drive_file),
                      color: Colors.indigo,
                      text: 'Document'),
                  iconWidget(
                      icon: const Icon(Icons.camera_alt),
                      color: Colors.pinkAccent,
                      text: 'Camera'),
                  iconWidget(
                      icon: const Icon(Icons.insert_photo),
                      color: Colors.purple,
                      text: 'Gallery'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWidget(
                      icon: const Icon(Icons.headphones),
                      color: Colors.deepOrange,
                      text: 'Audio'),
                  iconWidget(
                      icon: const Icon(Icons.location_pin),
                      color: Colors.green,
                      text: 'Location'),
                  iconWidget(
                      icon: const Icon(Icons.currency_rupee),
                      color: Colors.cyan,
                      text: 'Payment')
                ],
              ),
              const SizedBox(
                height:10
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 30,),
                  iconWidget(
                      icon: const Icon(Icons.person),
                      color: Colors.blue,
                      text: 'Contact')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconWidget({Icon? icon, Color? color, String? text}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: icon,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text!),
      ],
    );
  }
}
