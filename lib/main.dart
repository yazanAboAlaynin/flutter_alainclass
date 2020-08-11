import 'package:alainclass/repositories/repositories.dart';
import 'package:alainclass/screens/start_video.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'blocs/simple_bloc_observer.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();
  final HomeRepository homeRepository = HomeRepository(
    api: Api(
      httpClient: http.Client(),
    ),
  );
  runApp(AlainClass(homeRepository: homeRepository));
}

class AlainClass extends StatelessWidget {
  final HomeRepository homeRepository;
  AlainClass({Key key, @required this.homeRepository})
      : assert(homeRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlainClass',
      home: BlocProvider(
          create: (context) => HomeBloc(homeRepository: homeRepository),
          child: ButterFlyAssetVideo()),
    );
  }
}
