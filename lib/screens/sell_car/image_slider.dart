import 'package:alainclass/screens/view_car/open_image.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MySlider extends StatelessWidget {
  final List images;

  const MySlider({Key key, this.images}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    List imageSliders = List.generate(images.length, (index) {
      Asset asset = images[index];
      return Container(
        margin: EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          ),
        ),
      );
    }).toList();

    return Carousel(
      //boxFit: BoxFit.,
      images: imageSliders,
      autoplay: false,
      animationCurve: Curves.fastOutSlowIn,
      showIndicator: false,
    );
  }
}
