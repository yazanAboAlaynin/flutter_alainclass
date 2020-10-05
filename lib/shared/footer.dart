import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFooter extends StatelessWidget {
  fb() async {
    const url = 'https://www.facebook.com/alainclassuae';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  tw() async {
    const url = 'https://twitter.com/alainclassuae';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ins() async {
    const url = 'http://instagram.com/alainclassmotors';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return Container(
      width: sizeAware.width,
      //height: sizeAware.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Alain Class Motors. The ' +
                  'world\'s most exclusive automobile showroom' +
                  'and voted \'World\'s best supercar delevership\'.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: sizeAware.width * 0.05,
                  fontFamily: 'Gentium'),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: sizeAware.height * 0.02,
            ),
            Text(
              'Our Exclusive Brands',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: sizeAware.width * 0.05,
                  fontFamily: 'Gentium'),
              textAlign: TextAlign.center,
            ),
            Container(
              width: sizeAware.width * 0.5,
              child: Divider(
                color: Colors.redAccent[700],
                height: sizeAware.height * 0.02,
              ),
            ),
            SizedBox(
              height: sizeAware.height * 0.02,
            ),
            Image.asset('assets/images/logo1.png'),
            SizedBox(
              height: sizeAware.height * 0.03,
            ),
            Image.asset('assets/images/logo2.png'),
            SizedBox(
              height: sizeAware.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: fb,
                    child: Image.asset('assets/images/facebook.png')),
                SizedBox(
                  width: sizeAware.width * 0.04,
                ),
                GestureDetector(
                    onTap: tw, child: Image.asset('assets/images/twitter.png')),
                SizedBox(
                  width: sizeAware.width * 0.04,
                ),
                GestureDetector(
                    onTap: ins,
                    child: Image.asset('assets/images/instagram.png')),
              ],
            ),
            SizedBox(
              height: sizeAware.height * 0.1,
            ),
            Text(
              'copyright © 2020 Alain Class Motors',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: sizeAware.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
