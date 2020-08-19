import 'package:alainclass/blocs/blocs.dart';
import 'package:alainclass/blocs/sell_car/sell_car_event.dart';
import 'package:alainclass/blocs/sell_car/sell_car_state.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:alainclass/repositories/sell_car/sell_car_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class SellCarBloc extends Bloc<SellCarEvent, SellCarState> {
  final SellCarRepository sellCarRepository;

  SellCarBloc({@required this.sellCarRepository}) : super(SellCarInitial());
  @override
  Stream<SellCarState> mapEventToState(SellCarEvent event) async* {
    if (event is SellCarRequested) {
      yield SellCarLoadInProgress();
      try {
        await sellCarRepository.sellCar(event.assets, event.data);
        yield SellCarFinished();
      } catch (_) {
        yield SellCarLoadFailure();
      }
    }
  }
}
