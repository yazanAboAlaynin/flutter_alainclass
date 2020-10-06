import 'package:alainclass/repositories/home/api.dart';
import 'package:alainclass/screens/about_us.dart';
import 'package:alainclass/screens/brands.dart';
import 'package:alainclass/screens/contact_us/contact_us.dart';
import 'package:alainclass/screens/home/home.dart';
import 'package:alainclass/screens/inventory.dart';
import 'package:alainclass/screens/news/news_events.dart';
import 'package:alainclass/screens/news/view_news.dart';
import 'package:alainclass/screens/notifications/notifications.dart';
import 'package:alainclass/screens/search_screen.dart';
import 'package:alainclass/screens/sell_car/sell_car.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool showSrch = true;
  String brand = "";
  String year = "";
  String neworused = "";
  List search_list = [];
  Api api = Api(
    httpClient: http.Client(),
  );
  Future getSearchList() async {
    try {
      List list = await api.getSearchList();
      setState(() {
        search_list = list;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getSearchList();
  }

  List getDropDownItems(myList, name) {
    List<DropdownMenuItem<String>> list = [];
    list.add(
      DropdownMenuItem<String>(
        value: "",
        child: Text(
          name,
        ),
      ),
    );
    myList.forEach((key, value) {
      list.add(
        DropdownMenuItem<String>(
          value: key,
          child: Text(
            value,
          ),
        ),
      );
    });
    return list;
  }

  List getYearItems(List myList) {
    List<DropdownMenuItem<String>> list = [];
    list.add(
      DropdownMenuItem<String>(
        value: "",
        child: Text(
          "Year",
        ),
      ),
    );
    for (int i = 0; i < myList.length; i++) {
      list.add(
        DropdownMenuItem<String>(
          value: myList[i],
          child: Text(
            myList[i],
          ),
        ),
      );
    }
    return list;
  }

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
        centerTitle: true,
        title: Image.asset(
          'assets/images/black_logo.png',
          fit: BoxFit.cover,
          width: 130,
          //height: sizeAware.height * 0.01,
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
                          fontFamily: 'Gentium'),
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
                      MaterialPageRoute(builder: (context) => Notifications()));
                },
                child: Container(
                  width: sizeAware.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sizeAware.width * 0.05,
                          fontFamily: 'Gentium'),
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
                      MaterialPageRoute(builder: (context) => ChooseType()));
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
                          fontFamily: 'Gentium'),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {
                  search_list.length != 0
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Brands(
                                    brands: search_list[0],
                                  )))
                      : () {};
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
                          fontFamily: 'Gentium'),
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
                      MaterialPageRoute(builder: (context) => NewsEvents()));
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
                          fontFamily: 'Gentium'),
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
                          fontFamily: 'Gentium'),
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
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                child: Container(
                  width: sizeAware.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'About Us',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sizeAware.width * 0.05,
                          fontFamily: 'Gentium'),
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
                      MaterialPageRoute(builder: (context) => ContactUs()));
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
                          fontFamily: 'Gentium'),
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
                        size: 30,
                      ),
                      Text(
                        'Search Your Car',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            //  fontWeight: FontWeight.bold,
                            fontFamily: 'Gentium'),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 30,
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
                          height: sizeAware.height >= sizeAware.width
                              ? sizeAware.height * 0.07
                              : sizeAware.width * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              // itemHeight: sizeAware.height * 0.07,
                              icon: Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              iconDisabledColor: Colors.white,
                              iconEnabledColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              dropdownColor: Colors.grey[800],
                              underline: SizedBox(),
                              items: search_list.length == 0
                                  ? []
                                  : getDropDownItems(search_list[0], "Make"),
                              value: brand == "" ? null : "$brand",
                              onChanged: (value) {
                                setState(() {
                                  brand = value;
                                });
                              },
                              hint: Text(
                                "Make",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Gentium'),
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: sizeAware.height >= sizeAware.width
                              ? sizeAware.height * 0.07
                              : sizeAware.width * 0.07,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              icon: Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              iconDisabledColor: Colors.white,
                              iconEnabledColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              dropdownColor: Colors.grey[800],
                              underline: SizedBox(),
                              items: search_list.length == 0
                                  ? []
                                  : getDropDownItems(search_list[1], "All"),
                              value: neworused == "" ? null : "$neworused",
                              onChanged: (value) {
                                setState(() {
                                  neworused = value;
                                });
                              },
                              hint: Text(
                                "All",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Gentium'),
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: sizeAware.height >= sizeAware.width
                              ? sizeAware.height * 0.07
                              : sizeAware.width * 0.07,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              icon: Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              iconDisabledColor: Colors.white,
                              iconEnabledColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              dropdownColor: Colors.grey[800],
                              underline: SizedBox(),
                              items: search_list.length == 0
                                  ? []
                                  : getYearItems(search_list[2]),
                              value: year == "" ? null : "$year",
                              onChanged: (value) {
                                setState(() {
                                  year = value;
                                });
                              },
                              hint: Text(
                                "Year",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Gentium'),
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
                                builder: (context) => SearchScreen(
                                  brand: brand,
                                  neworused: neworused,
                                  year: year,
                                ),
                              ),
                            );
                          },
                          height: sizeAware.height >= sizeAware.width
                              ? sizeAware.height * 0.07
                              : sizeAware.width * 0.07,
                          minWidth: sizeAware.width,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          color: Colors.red,
                          textColor: Colors.white,
                          child: new Text(
                            "Search",
                            style: TextStyle(
                                fontSize: 20.0, fontFamily: 'Gentium'),
                          ),
                          splashColor: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: sizeAware.height * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
