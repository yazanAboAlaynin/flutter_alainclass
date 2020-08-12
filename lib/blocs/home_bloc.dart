import 'package:alainclass/models/models.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'blocs.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({@required this.homeRepository})
      : assert(homeRepository != null),
        super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeRequested) {
      yield HomeLoadInProgress();
      try {
        final List home_page = await homeRepository.getHomePage();

        final List<Car> new_arrivals = home_page[0];
        final List sliders = home_page[1];
        final List search_list = home_page[2];
        //print(slider_images);
        yield HomeLoadSuccess(
            new_arrivals: new_arrivals,
            slider_images: sliders,
            search_list: search_list);
      } catch (_) {
        yield HomeLoadFailure();
      }
    } else if (event is SearchRequested) {
      yield HomeLoadInProgress();
      try {
        final List<Car> cars = await homeRepository.search(
            event.brand, event.year, event.neworused);
        yield SearchLoadSuccess(cars: cars);
      } catch (_) {}
    }
  }
}
