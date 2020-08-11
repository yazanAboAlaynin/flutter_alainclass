import 'package:alainclass/blocs/blocs.dart';
import 'package:alainclass/screens/home/image_carusel.dart';
import 'package:alainclass/screens/sell_car.dart';
import 'package:alainclass/shared/car_card.dart';
import 'package:alainclass/shared/footer.dart';
import 'package:alainclass/shared/my_drawer.dart';
import 'package:alainclass/shared/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeRequested());
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  List data = ['item1', 'item2'];
  bool showDesc = true;

  Widget new_arrivals = Column(
    children: <Widget>[
      CarCard(
        image: 'assets/images/cover7.jpg',
      ),
      CarCard(
        image: 'assets/images/cover6.jpg',
      ),
      CarCard(
        image: 'assets/images/cover5.jpg',
      ),
      CarCard(
        image: 'assets/images/cover4.jpg',
      ),
    ],
  );

  Widget latest_news = Row(
    children: <Widget>[
      NewsCard(
        image: 'assets/images/cover4.jpg',
      ),
      NewsCard(
        image: 'assets/images/cover5.jpg',
      ),
      NewsCard(
        image: 'assets/images/cover6.jpg',
      ),
      NewsCard(
        image: 'assets/images/cover1.jpg',
      ),
    ],
  );

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: sizeAware.height * 0.4,
              child: ImageCarusel(),
            ),
            SizedBox(
              height: sizeAware.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  setState(() {
                    showDesc = !showDesc;
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
                visible: showDesc,
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: sizeAware.height * 0.02,
            ),
            Divider(
              color: Colors.redAccent[700],
              height: sizeAware.height * 0.02,
            ),
            Text(
              'New Arrivals',
              style: TextStyle(
                color: Colors.white,
                fontSize: sizeAware.width * 0.10,
              ),
            ),
            Divider(
              color: Colors.redAccent[700],
              height: sizeAware.height * 0.02,
            ),
            Container(
              //height: sizeAware.height * 0.44,
              child: new_arrivals,
            ),
            SizedBox(height: sizeAware.height * 0.04),
            Divider(
              color: Colors.redAccent[700],
              height: sizeAware.height * 0.02,
            ),
            Text(
              'Latest News',
              style: TextStyle(
                  color: Colors.white, fontSize: sizeAware.width * 0.05),
            ),
            Container(
              height: sizeAware.height * 0.3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  latest_news,
                ],
              ),
            ),
            SizedBox(height: sizeAware.height * 0.04),
            Divider(
              color: Colors.redAccent[700],
              height: sizeAware.height * 0.02,
            ),
            MyFooter(),
          ],
        ),
      ),
    );
  }
}
