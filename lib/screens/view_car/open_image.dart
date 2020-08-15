import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class OpenImage extends StatefulWidget {
  String image;
  OpenImage({this.image});
  @override
  _OpenImageState createState() => _OpenImageState();
}

class _OpenImageState extends State<OpenImage> {
  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: PhotoView(
          imageProvider:
              NetworkImage('https://www.alainclass.com/' + widget.image),
        ),
      ),
    );
  }
}
