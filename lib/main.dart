import 'package:alainclass/screens/start_video.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AlainClass());
}

class AlainClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlainClass',
      home: ButterFlyAssetVideo(),
    );
  }
}
