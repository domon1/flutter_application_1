import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/pages/home_page/bloc/item_list/item_list_bloc.dart';
import 'package:flutter_application_1/features/pages/home_page/bloc/news_list/news_list_bloc.dart';
import 'package:flutter_application_1/features/pages/home_page/cards/news_card.dart';
import 'package:flutter_application_1/repositorty/models/news_list_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocNewsList extends StatelessWidget {
  const BlocNewsList({
    super.key,
    required NewsListBloc newsListBlock,
  }) : _newsListBlock = newsListBlock;

  final NewsListBloc _newsListBlock;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListBloc, NewsListState>(
      bloc: _newsListBlock,
      builder: (context, state) {
        if (state is NewsListStateLoaded) {
          return NewsScrollHorizontal(news: state.newsList);
        } else if (state is ItemListLoadingFailture) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Ошибка загрузки ...'),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    _newsListBlock.add(NewsListEventLoad());
                  },
                  child: const Text('Попробовать снова'))
            ],
          ));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class NewsScrollHorizontal extends StatelessWidget {
  const NewsScrollHorizontal({super.key, required this.news});

  final List<NewsListModel> news;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: ListView.builder(
          itemCount: news.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return NewsCard(
              news: news[index],
            );
          }),
    );
  }
}
