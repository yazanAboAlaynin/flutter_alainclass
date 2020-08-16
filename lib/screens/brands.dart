import 'package:alainclass/screens/search_screen.dart';
import 'package:alainclass/shared/my_drawer.dart';
import 'package:flutter/material.dart';

class Brands extends StatelessWidget {
  final Map brands;

  Brands({Key key, this.brands}) : super(key: key);
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    List<Widget> list = [];
    var sortedKeys = brands.keys.toList()..sort();
    int c = "A".codeUnitAt(0);
    int end = "Z".codeUnitAt(0);
    while (c <= end) {
      List<Widget> brds = [];
      for (int i = 0; i < brands.length; i++) {
        if (brands[sortedKeys[i]].substring(0, 1) == String.fromCharCode(c)) {
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
                brands[sortedKeys[i]],
                style: TextStyle(
                  color: Colors.white,
                ),
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
                  ),
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
          Icon(
            Icons.call,
            size: sizeAware.width * 0.1,
          ),
        ],
      ),
      drawer: Drawer(
        child: MyDrawer(),
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
