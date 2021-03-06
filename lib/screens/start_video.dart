import 'package:alainclass/blocs/blocs.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import 'home/home.dart';

class AssetVideo extends StatefulWidget {
  @override
  AssetVideoState createState() => AssetVideoState();
}

class AssetVideoState extends State<AssetVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/splash_video.mp4');
    _controller.addListener(checkVideo);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: sizeAware.width,
        height: sizeAware.height,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  void checkVideo() {
    if (_controller.value.position == _controller.value.duration) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    }
  }
}
