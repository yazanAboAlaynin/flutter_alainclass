import 'package:alainclass/shared/footer.dart';
import 'package:alainclass/shared/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  calling() async {
    const url = 'tel:0097143782222';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  map(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: sizeAware.width * 0.1,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          'assets/images/black_logo.png',
          fit: BoxFit.cover,
          width: sizeAware.width * 0.4,
          //height: sizeAware.height * 0.01,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.call,
                size: sizeAware.width * 0.1,
              ),
              onPressed: calling)
        ],
      ),
      drawer: Drawer(
        child: MyDrawer(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Container(
              height: sizeAware.height * 0.3,
              child: Image.asset(
                "assets/images/Contact.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: sizeAware.height * 0.01,
            ),
            Text(
              'Show Room Location',
              style: TextStyle(
                  color: Colors.white, fontSize: sizeAware.width * 0.05),
            ),
            Container(
                width: sizeAware.width * 0.4,
                child: Divider(
                  color: Colors.red,
                )),
            SizedBox(
              height: sizeAware.height * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alain Class Motors is owned and operated by experienced professionals with a passion for great automobiles. Our dedication to great service means the buying experience is smooth, easy and worry free.\n\nWe have 5 branches in the U.A.E.",
                  style: TextStyle(
                      color: Colors.white, fontSize: sizeAware.width * 0.04),
                ),
                SizedBox(
                  height: sizeAware.height * 0.02,
                ),
                Text(
                  'Main Branch Dubai',
                  style: TextStyle(
                      color: Colors.red, fontSize: sizeAware.width * 0.06),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Text(
                  'Sheikh Zayed Road\nPhone: +971-4-3782222\nFax: +971-4-3790337\nEmail: info@alainclass.com\n',
                  style: TextStyle(
                      color: Colors.white, fontSize: sizeAware.width * 0.04),
                ),
                FlatButton.icon(
                  color: Colors.red,
                  onPressed: () {
                    map('https://www.google.com/maps/place/Al+Ain+Class+Motors/@25.1513808,55.2269256,16z/data=!4m5!3m4!1s0x0:0xc7ae996781da83a0!8m2!3d25.152253!4d55.224751?hl=ar');
                  },
                  icon: Icon(
                    Icons.directions_car,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Get Directions',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: sizeAware.height * 0.02,
                ),
                Text(
                  'Dubai Branch',
                  style: TextStyle(
                      color: Colors.red, fontSize: sizeAware.width * 0.06),
                ),
                FlatButton.icon(
                  color: Colors.red,
                  onPressed: () {
                    map('https://www.google.com/maps/place/Al+Ain+Class+Motors/@24.675535,55.212568,9z/data=!4m5!3m4!1s0x3e5f6989ab6056d5:0xc7ae996781da83a0!8m2!3d25.152253!4d55.224751?hl=ar');
                  },
                  icon: Icon(
                    Icons.directions_car,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Get Directions',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Text(
                  'DIP Branch',
                  style: TextStyle(
                      color: Colors.red, fontSize: sizeAware.width * 0.06),
                ),
                FlatButton.icon(
                  color: Colors.red,
                  onPressed: () {
                    map('https://www.google.com/maps/place/Al+Ain+Class+Motors/@24.675535,55.212568,9z/data=!4m5!3m4!1s0x3e5f6989ab6056d5:0xc7ae996781da83a0!8m2!3d25.152253!4d55.224751?hl=ar');
                  },
                  icon: Icon(
                    Icons.directions_car,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Get Directions',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Text(
                  'Alain Branch',
                  style: TextStyle(
                      color: Colors.red, fontSize: sizeAware.width * 0.06),
                ),
                FlatButton.icon(
                  color: Colors.red,
                  onPressed: () {
                    map('https://www.google.com/maps/place/%D8%A7%D9%84%D8%B9%D9%8A%D9%86+%D9%83%D9%84%D8%A7%D8%B3+%D9%85%D9%88%D8%AA%D9%88%D8%B1%D8%B2%E2%80%AD/@24.19827,55.761977,16z/data=!4m5!3m4!1s0x0:0x17e2ee12f480331d!8m2!3d24.1982696!4d55.7619774?hl=ar');
                  },
                  icon: Icon(
                    Icons.directions_car,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Get Directions',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.red,
            ),
            MyFooter(),
          ]),
        ),
      ),
    );
  }
}
