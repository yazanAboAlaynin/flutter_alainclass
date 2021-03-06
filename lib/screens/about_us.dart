import 'package:alainclass/shared/footer.dart';
import 'package:alainclass/shared/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  calling() async {
    print('here');
    const url = 'tel:0097143782222';

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
            size: 45,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          'assets/images/black_logo.png',
          fit: BoxFit.cover,
          width: 90,
          //height: sizeAware.height * 0.01,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.call,
              size: 40,
            ),
            onPressed: calling,
          ),
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
                "assets/images/b.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: sizeAware.height * 0.01,
            ),
            Text(
              'About Us',
              style: TextStyle(
                  color: Colors.white, fontSize: sizeAware.width * 0.07),
            ),
            Container(
                width: sizeAware.width * 0.35,
                child: Divider(
                  color: Colors.red,
                )),
            SizedBox(
              height: sizeAware.height * 0.02,
            ),
            Text(
              "Welcome to Al Ain Class Motors, the world’s most exclusive automobile showroom.\n\nOver 20 years experience in the exotic and luxury car business. Our mission is to provide our customers worldwide the best selection of new and pre owned vehicles available in the market.\n\nAs a car enthusiast and collector, Mr. Abdulla Al ketbi started trading luxury cars in the year 1992. He mainly started importing Mercedes Benz from Germany and selling to close relatives and friends. By 1995 the first Alain Class Motors Showroom was open in his city in Alain, U.A.E.\n\nFor over 20 years we have provided our discerning customers with exotic and luxury vehicles. Our wide selection of new and pre-owned cars include the world’s most exciting and exclusive brands.\n\nWe are renowned for our range, always maintaining 100 outstanding automobiles in stock at any given time. Our main aim is to establish long term business relationships with our customers by providing the best quality vehicles, excellent after-sale service, value for money and assistance with delivery arrangements to any port or airport worldwide.\n\nWe invite you to browse through our website for new and pre owned cars or visit us at any of our branches.",
              style: TextStyle(
                  color: Colors.white, fontSize: sizeAware.width * 0.04),
            ),
            SizedBox(
              height: sizeAware.height * 0.02,
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
