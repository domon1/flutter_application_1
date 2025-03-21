import 'package:dio/dio.dart';
import 'package:flutter_application_1/repositorty/repository_view.dart';


class ItemRepository implements AbstractRepository<ItemListModel, ItemModel> {
  final Dio dio;
  final String url = 'http://192.168.0.11:8080/item';
  //192.168.0.13
  //172.20.10.3

  ItemRepository({required this.dio});

  @override
  Future<List<ItemListModel>> getAllItem() async {
    final response = await Dio().get('$url/all');
    List<ItemListModel> itemList = [];
    for (var tile in response.data) {
      itemList.add(ItemListModel.fromJson(tile));
    }
    return itemList;
  }

  @override
  Future<ItemModel> getItemById(int id) async {
    final response = await Dio().get('$url/$id');
    final data = response.data as Map<String, dynamic>;
    return ItemModel.fromJson(data);
  }
}
