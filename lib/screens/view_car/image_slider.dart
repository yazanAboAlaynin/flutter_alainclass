import 'package:alainclass/screens/view_car/open_image.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/cover1.jpg',
  'assets/images/cover2.jpg',
  'assets/images/cover3.jpg',
  'assets/images/cover4.jpg',
  'assets/images/cover5.jpg',
  'assets/images/cover6.jpg',
  'assets/images/cover7.jpg',
];

class ManuallyControlledSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    final List<Widget> imageSliders = imgList
        .map((item) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OpenImage(image: item)));
              },
              child: Container(
                margin: EdgeInsets.all(4.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: sizeAware.width,
                      height: sizeAware.height,
                    )),
              ),
            ))
        .toList();
    return Carousel(
      boxFit: BoxFit.cover,
      images: imageSliders,
      autoplay: false,
      animationCurve: Curves.fastOutSlowIn,
      showIndicator: false,
    );
  }
}
