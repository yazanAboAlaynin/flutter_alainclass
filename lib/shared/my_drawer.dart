import 'package:alainclass/screens/home/home.dart';
import 'package:alainclass/screens/sell_car.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool showSrch = true;
  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey,
            height: sizeAware.height * 0.001,
          ),
          preferredSize: Size.fromHeight(1.0),
        ),
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/images/black_logo.png',
          fit: BoxFit.cover,
          width: sizeAware.width * 0.4,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Container(
                  width: sizeAware.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Home',
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
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Container(
                  width: sizeAware.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Inventory',
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
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Container(
                  width: sizeAware.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Brands',
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
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Container(
                  width: sizeAware.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'News and Events',
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SellCar()));
                },
                child: Container(
                  width: sizeAware.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sell your car',
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
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'About Us',
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
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Container(
                  width: sizeAware.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Contact Us',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showSrch = !showSrch;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: sizeAware.width * 0.1,
                      ),
                      Text(
                        'Search Your Car',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: sizeAware.width * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Visibility(
                  visible: showSrch,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          height: sizeAware.height * 0.07,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              icon: Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              iconDisabledColor: Colors.white,
                              iconEnabledColor: Colors.white,
                              underline: SizedBox(),
                              items: [
                                DropdownMenuItem<String>(
                                  value: "1",
                                  child: Text(
                                    "First",
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: "2",
                                  child: Text(
                                    "Second",
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                print("value: $value");
                              },
                              hint: Text(
                                "Make",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          height: sizeAware.height * 0.07,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              icon: Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              iconDisabledColor: Colors.white,
                              iconEnabledColor: Colors.white,
                              underline: SizedBox(),
                              items: [
                                DropdownMenuItem<String>(
                                  value: "1",
                                  child: Text(
                                    "First",
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: "2",
                                  child: Text(
                                    "Second",
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                print("value: $value");
                              },
                              hint: Text(
                                "All",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          height: sizeAware.height * 0.07,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              icon: Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              iconDisabledColor: Colors.white,
                              iconEnabledColor: Colors.white,
                              underline: SizedBox(),
                              items: [
                                DropdownMenuItem<String>(
                                  value: "1",
                                  child: Text(
                                    "First",
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: "2",
                                  child: Text(
                                    "Second",
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                print("value: $value");
                              },
                              hint: Text(
                                "Year",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SellCar()));
                          },
                          height: sizeAware.height * 0.07,
                          minWidth: sizeAware.width,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: Colors.red,
                          textColor: Colors.white,
                          child: new Text(
                            "Search",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          splashColor: Colors.redAccent,
                        ),
                      ),
                      SizedBox(
                        height: sizeAware.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
