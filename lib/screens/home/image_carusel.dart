import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImageCarusel extends StatefulWidget {
  @override
  _ImageCaruselState createState() => _ImageCaruselState();
}

class _ImageCaruselState extends State<ImageCarusel> {
  @override
  Widget build(BuildContext context) {
    return Carousel(
      boxFit: BoxFit.contain,
      images: <AssetImage>[
        AssetImage('assets/images/cover3.jpg'),
        AssetImage('assets/images/cover4.jpg'),
        AssetImage('assets/images/cover1.jpg'),
        AssetImage('assets/images/cover2.jpg'),
        AssetImage('assets/images/cover5.jpg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      autoplayDuration: Duration(
        milliseconds: 5000,
      ),
      animationDuration: Duration(
        milliseconds: 1000,
      ),
      dotSize: 5.0,
      indicatorBgPadding: 5.0,
      dotBgColor: Colors.black,
      dotIncreasedColor: Colors.red,
    );
  }
}
