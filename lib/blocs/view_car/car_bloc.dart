import 'package:alainclass/blocs/blocs.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final CarRepository carRepository;

  CarBloc({@required this.carRepository}) : super(CarInitial());
  @override
  Stream<CarState> mapEventToState(CarEvent event) async* {
    if (event is CarRequested) {
      yield CarLoadInProgress();
      try {
        final List car_page = await carRepository.getCarPage(event.id);
        yield CarLoadSuccess(
          description: car_page[0],
          main_image: car_page[1],
          images: car_page[2],
          similar_cars: car_page[3],
        );
      } catch (_) {
        yield CarLoadFailure();
      }
    } else if (event is SendEnquiries) {
      yield CarLoadInProgress();
      try {
        await carRepository.sendEnquiries(event.data);
        yield SendFinished();
      } catch (_) {
        yield CarLoadFailure();
      }
    }
  }
}
