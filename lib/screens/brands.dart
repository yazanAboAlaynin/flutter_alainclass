import 'package:alainclass/repositories/shared_pref.dart';
import 'package:alainclass/screens/search_screen.dart';
import 'package:alainclass/shared/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'notifications/notifications.dart';

class Brands extends StatefulWidget {
  final Map brands;

  Brands({this.brands});

  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  calling() async {
    print('here');
    const url = 'tel:0097143782222';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int notificationsNumber = 0;

  Future<int> getNotificationsNumber() async {
    int x = await SharedPrefs.getNotificationsNumber();
    setState(() {
      notificationsNumber = x;
    });
  }

  @override
  void initState() {
    getNotificationsNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    List<Widget> list = [];
    var sortedKeys = widget.brands.keys.toList()..sort();
    int c = "A".codeUnitAt(0);
    int end = "Z".codeUnitAt(0);
    while (c <= end) {
      List<Widget> brds = [];
      for (int i = 0; i < widget.brands.length; i++) {
        if (widget.brands[sortedKeys[i]].substring(0, 1) ==
            String.fromCharCode(c)) {
          brds.add(InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      brand: sortedKeys[i],
                      neworused: '',
                      year: '',
                    ),
                  ));
            },
            child: Container(
              child: Text(
                widget.brands[sortedKeys[i]],
                style: TextStyle(color: Colors.white, fontFamily: 'Gentium'),
              ),
            ),
          ));
          brds.add(SizedBox(
            height: sizeAware.height * 0.02,
          ));
        }
      }
      if (brds.length > 0) {
        var x = Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: sizeAware.width,
                child: Text(
                  String.fromCharCode(c),
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: sizeAware.width * 0.05,
                      fontFamily: 'Gentium'),
                ),
              ),
              SizedBox(
                height: sizeAware.height * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: brds,
              ),
            ],
          ),
        );
        list.add(x);
      }
      c++;
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 35,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          'assets/images/black_logo.png',
          fit: BoxFit.cover,
          width: 130,
          //height: sizeAware.height * 0.01,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 6, 2),
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Notifications(),
                      ),
                    ).then((value) => getNotificationsNumber());
                  },
                ),
                notificationsNumber == 0
                    ? Container()
                    : Positioned(
                        bottom: 10,
                        right: 2,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Text(
                              '$notificationsNumber',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 2, 6, 2),
            child: IconButton(
              icon: Icon(
                Icons.call,
                size: 30,
              ),
              onPressed: calling,
            ),
          ),
        ],
      ),
      drawer: Container(
        width: sizeAware.width,
        child: Drawer(
          child: MyDrawer(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: list,
          ),
        ),
      ),
    );
  }
}
