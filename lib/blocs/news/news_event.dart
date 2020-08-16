import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class NewsRequested extends NewsEvent {
  const NewsRequested();
  @override
  List<Object> get props => [];
}
