import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
List <CameraDescription> cameras = [];

class CameraPage extends StatefulWidget {
  CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
 late CameraController _cameraController;
  Future<void> ? cameraValue;
  int changeCamera = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[changeCamera], ResolutionPreset.high);
    cameraValue  = _cameraController.initialize();
    
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 500,
          height: double.infinity,
          child: FutureBuilder(
            future:cameraValue ,
            builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done){
              return CameraPreview(_cameraController);
            }else{
              return const CircularProgressIndicator();
            }
            
          },),
        ),
        IconButton(onPressed: (){
          setState(() {
            changeCamera = changeCamera == 0 ? 1 : 0;
            _cameraController = CameraController(cameras[changeCamera], ResolutionPreset.high);
            cameraValue = _cameraController.initialize();
          });
        }, icon:const Icon(Icons.camera_alt))
      ],
    );
  }
}