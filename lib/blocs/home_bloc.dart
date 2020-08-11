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
        final List<Car> new_arrivals = await homeRepository.getNewArrivals();
        yield HomeLoadSuccess(new_arrivals: new_arrivals);
      } catch (_) {
        yield HomeLoadFailure();
      }
    }
  }
}
