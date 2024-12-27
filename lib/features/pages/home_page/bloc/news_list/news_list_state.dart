part of 'news_list_bloc.dart';

abstract class NewsListState {}

class NewsListStateInitial extends NewsListState {}

class NewsListStateLoading extends NewsListState {}

class NewsListStateLoaded extends NewsListState {
  NewsListStateLoaded({required this.newsList});

  final List<NewsListModel> newsList;
}

class NewsListStateLoadingFalture extends NewsListState {
  NewsListStateLoadingFalture({required this.exeption});

  final Object? exeption;
}