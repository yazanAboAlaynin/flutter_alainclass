import 'package:alainclass/blocs/blocs.dart';
import 'package:alainclass/models/models.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:alainclass/shared/footer.dart';
import 'package:alainclass/shared/my_drawer.dart';
import 'package:alainclass/shared/show_cars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SearchScreen extends StatefulWidget {
  final String brand;
  final String neworused;
  final String year;

  SearchScreen({Key key, this.brand, this.neworused, this.year})
      : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  calling() async {
    print('here');
    const url = 'tel:0097143782222';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  final HomeRepository homeRepository = HomeRepository(
    api: Api(
      httpClient: http.Client(),
    ),
  );

  HomeBloc homeBloc;

  List<Car> search_res = [];
  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc(homeRepository: homeRepository);
  }

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final sizeAware = MediaQuery.of(context).size;

    return BlocBuilder(
      cubit: homeBloc,
      builder: (context, state) {
        if (state is HomeInitial) {
          homeBloc.add(SearchRequested(
              brand: widget.brand,
              neworused: widget.neworused,
              year: widget.year));
        }
        if (state is HomeLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchLoadSuccess) {
          search_res = state.cars;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ShowCars(
                    cars: search_res,
                  ),
                  MyFooter(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
