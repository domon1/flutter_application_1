import 'package:flutter_application_1/repositorty/models/news_list_model.dart';
import 'package:flutter_application_1/repositorty/repository_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'news_list_event.dart';
part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  NewsListBloc(this.abstractRepository) : super(NewsListStateInitial()) {
    on<NewsListEventLoad>((event, emit) async {
      try {
        emit(NewsListStateLoading());
        final newsList = await abstractRepository.getAllItem();
        emit(NewsListStateLoaded(newsList: newsList as List<NewsListModel>));
      } catch (e, st) {
        emit(NewsListStateLoadingFalture(exeption: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }

  final AbstractRepository abstractRepository;
}