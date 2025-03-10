import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/repositorty/models/item_cart_model.dart';
import 'package:flutter_application_1/repositorty/models/order_model.dart';


class OrderRepository {
  final Dio dio;
  final String url = 'http://192.168.0.11:8080/order';
  //192.168.0.13

  OrderRepository({required this.dio});

  // Future<ProfileModel> getLoginUser(String username, String password) async {
  //   var data = '{"username": "$username", "password": "$password"}';
  //   final response = await Dio().get('$url/login', data: data);
  //   if (response.statusCode == 200) {
  //     ProfileModel profileModel = ProfileModel.fromMap(response.data);
  //     return profileModel;
  //   } else if (response.statusCode == 400) {
  //     return ProfileModel(id: 0, username: '', name: '');
  //   } else {
  //     return ProfileModel(id: 0, username: '', name: '');
  //   }
  // }

  Future<void> sendOrder(String username, List<ItemCartModel> data) async {
    List<dynamic> list = [];
    for (ItemCartModel item in data) {
      list.add(item.toMap());
    }
    var output = jsonEncode(list);
    await Dio().post('$url/save/$username', data: output);
  }

  Future<List<OrderModel>> getOrderByUsername(String username) async {
    final response = await Dio().get('$url/all/$username');
    //final data = response.data as Map<String, dynamic>;

    List<OrderModel> orderList = [];
    for (var tile in response.data) {
      orderList.add(OrderModel.fromMap(tile));
    }
    return orderList;
  }
}