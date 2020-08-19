import 'package:alainclass/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChooseType extends StatelessWidget {
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
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: sizeAware.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                        brand: '',
                        neworused: '',
                        year: '',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: sizeAware.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeAware.width * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          brand: '',
                          neworused: 'new',
                          year: '',
                        ),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: sizeAware.width,
                    child: Text(
                      'New',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeAware.width * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          brand: '',
                          neworused: 'used',
                          year: '',
                        ),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: sizeAware.width,
                    child: Text(
                      'Used',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeAware.width * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          brand: '',
                          neworused: 'sold',
                          year: '',
                        ),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: sizeAware.width,
                    child: Text(
                      'Sold',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeAware.width * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
