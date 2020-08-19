import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SellCarEvent extends Equatable {
  const SellCarEvent();
}

class SellCarRequested extends SellCarEvent {
  final List assets;
  final Map data;

  SellCarRequested({this.assets, this.data});

  @override
  List<Object> get props => [assets];
}
