import 'package:alainclass/blocs/blocs.dart';
import 'package:alainclass/models/models.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:alainclass/screens/home/image_carusel.dart';
import 'package:alainclass/screens/news/all_news.dart';
import 'package:alainclass/screens/sell_car/sell_car.dart';
import 'package:alainclass/shared/car_card.dart';
import 'package:alainclass/shared/footer.dart';
import 'package:alainclass/shared/my_drawer.dart';
import 'package:alainclass/shared/news_card.dart';
import 'package:alainclass/shared/show_cars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:alainclass/main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeRepository homeRepository = HomeRepository(
    api: Api(
      httpClient: http.Client(),
    ),
  );
  HomeBloc homeBloc;
  List<Car> new_arrivals = [];
  List slider_images = [];
  List search_list = [];
  List latest_news = [];
  String brand = "";
  String year = "";
  String neworused = "";
  int cnt = 0;

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc(homeRepository: homeRepository);
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool showDesc = true;

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

  calling() async {
    print('here');
    const url = 'tel:0097143782222';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;

    return BlocBuilder(
      cubit: homeBloc,
      builder: (context, state) {
        if (state is HomeInitial) {
          homeBloc.add(HomeRequested());
        }
        if (state is HomeLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchLoadSuccess) {
          new_arrivals = state.cars;

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
                width: 130,
                //height: sizeAware.height * 0.01,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 6, 2),
                  child: IconButton(
                    icon: Icon(
                      Icons.call,
                      size: 40,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //======== Carusel =================
                  Container(
                    height: sizeAware.height * 0.35,
                    child: ImageCarusel(
                      images: slider_images,
                    ),
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
                                fontSize: 20,
                                //   fontWeight: FontWeight.bold,
                                fontFamily: 'Gentium'),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
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
                                  items:
                                      getDropDownItems(search_list[0], "Make"),
                                  value: brand == "" ? null : "$brand",
                                  onChanged: (value) {
                                    setState(() {
                                      brand = value;
                                    });
                                  },
                                  hint: Text(
                                    "Make",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Gentium'),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
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
                                  items:
                                      getDropDownItems(search_list[1], "All"),
                                  value: neworused == "" ? null : "$neworused",
                                  onChanged: (value) {
                                    setState(() {
                                      neworused = value;
                                    });
                                  },
                                  hint: Text(
                                    "All",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Gentium'),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
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
                                  items: getYearItems(search_list[2]),
                                  value: year == "" ? null : "$year",
                                  onChanged: (value) {
                                    setState(() {
                                      year = value;
                                    });
                                  },
                                  hint: Text(
                                    "Year",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Gentium'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  showDesc = false;
                                });
                                homeBloc.add(
                                  SearchRequested(
                                    brand: brand,
                                    neworused: neworused,
                                    year: year,
                                  ),
                                );
                              },
                              height: sizeAware.height >= sizeAware.width
                                  ? sizeAware.height * 0.07
                                  : sizeAware.width * 0.07,
                              minWidth: sizeAware.width,
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
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
                    height: sizeAware.height * 0.02,
                  ),
                  Divider(
                    color: Colors.redAccent[700],
                    height: sizeAware.height * 0.02,
                  ),
                  Text(
                    'Search Results',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeAware.width * 0.10,
                        fontFamily: 'Gentium'),
                  ),
                  Divider(
                    color: Colors.redAccent[700],
                    height: sizeAware.height * 0.02,
                  ),
                  new_arrivals.length == 0
                      ? Text(
                          'No Results',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      : Container(
                          //height: sizeAware.height * 0.44,
                          child: ShowCars(
                            cars: new_arrivals,
                          ),
                        ),
                  SizedBox(height: sizeAware.height * 0.04),
                  Divider(
                    color: Colors.redAccent[700],
                    height: sizeAware.height * 0.02,
                  ),
                  Text(
                    'Latest News',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeAware.width * 0.05,
                        fontFamily: 'Gentium'),
                  ),
                  Container(
                    child: ShowNews(
                      news: latest_news,
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
        if (state is HomeLoadSuccess) {
          new_arrivals = state.new_arrivals ?? [];
          slider_images = state.slider_images ?? [];
          search_list = state.search_list ?? [];
          latest_news = state.latest_news ?? [];

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
                width: 130,
                //height: sizeAware.height * 0.01,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 6, 2),
                  child: IconButton(
                    icon: Icon(
                      Icons.call,
                      size: 40,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //======== Carusel =================
                  Container(
                    height: sizeAware.height * 0.35,
                    child: ImageCarusel(
                      images: slider_images,
                    ),
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
                                fontSize: 20,
                                //   fontWeight: FontWeight.bold,
                                fontFamily: 'Gentium'),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
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
                                  items:
                                      getDropDownItems(search_list[0], "Make"),
                                  value: brand == "" ? null : "$brand",
                                  onChanged: (value) {
                                    setState(() {
                                      brand = value;
                                    });
                                  },
                                  hint: Text(
                                    "Make",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Gentium'),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
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
                                  items:
                                      getDropDownItems(search_list[1], "All"),
                                  value: neworused == "" ? null : "$neworused",
                                  onChanged: (value) {
                                    setState(() {
                                      neworused = value;
                                    });
                                  },
                                  hint: Text(
                                    "All",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Gentium'),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
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
                                  items: getYearItems(search_list[2]),
                                  value: year == "" ? null : "$year",
                                  onChanged: (value) {
                                    setState(() {
                                      year = value;
                                    });
                                  },
                                  hint: Text(
                                    "Year",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Gentium'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  showDesc = false;
                                });
                                homeBloc.add(
                                  SearchRequested(
                                    brand: brand,
                                    neworused: neworused,
                                    year: year,
                                  ),
                                );
                              },
                              height: sizeAware.height >= sizeAware.width
                                  ? sizeAware.height * 0.07
                                  : sizeAware.width * 0.07,
                              minWidth: sizeAware.width,
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
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
                        fontFamily: 'Gentium'),
                  ),
                  Divider(
                    color: Colors.redAccent[700],
                    height: sizeAware.height * 0.02,
                  ),
                  Container(
                    //height: sizeAware.height * 0.44,
                    child: ShowCars(
                      cars: new_arrivals,
                    ),
                  ),
                  SizedBox(height: sizeAware.height * 0.04),
                  Divider(
                    color: Colors.redAccent[700],
                    height: sizeAware.height * 0.02,
                  ),
                  Text(
                    'Latest News',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeAware.width * 0.05,
                        fontFamily: 'Gentium'),
                  ),
                  Container(
                    child: ShowNews(
                      news: latest_news,
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
        if (state is HomeLoadFailure) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: FlatButton(
                  color: Colors.white,
                  onPressed: () {
                    homeBloc.add(HomeRequested());
                  },
                  child: Text('Try Again')),
            ),
          );
        }
      },
    );
  }
}
