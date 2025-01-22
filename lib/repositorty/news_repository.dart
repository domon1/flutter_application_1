import 'package:dio/dio.dart';
import 'package:flutter_application_1/repositorty/models/news_list_model.dart';
import 'package:flutter_application_1/repositorty/repository_view.dart';


class NewsRepository implements AbstractRepository<NewsListModel, ItemModel> {
  final Dio dio;
  final String url = 'http://192.168.0.13:8080/news';
  //192.168.0.13

  NewsRepository({required this.dio});

  @override
  Future<List<NewsListModel>> getAllItem() async {
    final response = await Dio().get('$url/all');
    List<NewsListModel> newsList = [];
    for (var tile in response.data) {
      newsList.add(NewsListModel.fromJson(tile));
    }
    return newsList;
  }

  @override
  Future<ItemModel> getItemById(int id) async {
    final response = await Dio().get('$url/$id');
    final data = response.data as Map<String, dynamic>;
    return ItemModel.fromJson(data);
  }
}