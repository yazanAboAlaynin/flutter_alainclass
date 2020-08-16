import 'package:alainclass/blocs/blocs.dart';
import 'package:alainclass/models/models.dart';
import 'package:alainclass/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc({@required this.newsRepository}) : super(NewsInitial());
  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsRequested) {
      yield NewsLoadInProgress();
      try {
        final List<News> news = await newsRepository.getNews();
        yield NewsLoadSuccess(news: news);
      } catch (_) {
        yield NewsLoadFailure();
      }
    }
  }
}
