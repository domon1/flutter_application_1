import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/appbar/appbar.dart';
import 'package:flutter_application_1/features/appbar/category/item_category.dart';
import 'package:flutter_application_1/features/pages/home_page/bloc/item_list/item_list_bloc.dart';
import 'package:flutter_application_1/features/pages/home_page/bloc/news_list/news_list_bloc.dart';
import 'package:flutter_application_1/features/pages/home_page/bloc_item_list_widget.dart';
import 'package:flutter_application_1/features/pages/home_page/bloc_news_list_widget.dart';
import 'package:flutter_application_1/repositorty/models/news_list_model.dart';
import 'package:flutter_application_1/repositorty/repository_view.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _itemListBlock = ItemListBloc(GetIt.I<AbstractRepository<ItemListModel, ItemModel>>());
  final _newsListBlock = NewsListBloc(GetIt.I<AbstractRepository<NewsListModel, ItemModel>>());

  List<ItemListModel>? items;

  @override
  void initState() {
    _itemListBlock.add(ItemListLoad());
    _newsListBlock.add(NewsListEventLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CoffeMakerAppBar(preferredSize: Size.fromHeight(50)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Выбери свой кофе', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 20),
              const ItemCategory(),
              const SizedBox(height: 20),
              BlocNewsList(newsListBlock: _newsListBlock),
              const SizedBox(height: 20),
              Text('Популярные напитки', style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: 20),
              BlocItemList(itemListBlock: _itemListBlock)
            ],
          ),
        ),
      ),
    );
  }
}
