import 'package:flutter_application_1/repositorty/models/item_cart_model.dart';

class OrderModel {
  final int id;
  final int userId;
  final int totalCost;
  final List<dynamic> items;

  OrderModel({required this.id, required this.userId, required this.totalCost, required this.items});

  Map<String, dynamic> toMap() {
    return {"id": id, "userId": userId, "totalCost": totalCost, "items": items};
  }

  factory OrderModel.fromMap(Map<String, dynamic> map){
    return OrderModel(id: map['id'], userId: map['userId'], totalCost: map['totalCost'], items: map['items']);
  }
}