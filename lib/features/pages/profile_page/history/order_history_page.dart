import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorty/models/item_cart_model.dart';
import 'package:flutter_application_1/repositorty/models/order_model.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  // List<OrderModel>? orders = [
  //   OrderModel(id: 1, userId: 0, totalCost: 1500, items: [
  //     ItemCartModel(id: 1, name: "Coffe", imageName: "Coffe", cost: 1, count: 2),
  //     ItemCartModel(id: 2, name: "Coffe", imageName: "Coffe", cost: 1, count: 3),
  //     ItemCartModel(id: 3, name: "Coffe", imageName: "Coffe", cost: 1, count: 4),
  //     ]),
  //   OrderModel(id: 2, userId: 0, totalCost: 12000, items: [
  //     ItemCartModel(id: 1, name: "Coffe", imageName: "Coffe", cost: 1, count: 2),
  //     ItemCartModel(id: 2, name: "Coffe", imageName: "Coffe", cost: 1, count: 3),
  //     ItemCartModel(id: 3, name: "Coffe", imageName: "Coffe", cost: 1, count: 4),
  //     ItemCartModel(id: 4, name: "Coffe", imageName: "Coffe", cost: 1, count: 5),
  //     ItemCartModel(id: 5, name: "Coffe", imageName: "Coffe", cost: 1, count: 6),
  //     ]),
  //   OrderModel(id: 3, userId: 0, totalCost: 480, items: [
  //     ItemCartModel(id: 1, name: "Coffe", imageName: "Coffe", cost: 1, count: 2),
  //     ])
  //   ];
  List<OrderModel>? orders;

  @override
  void didChangeDependencies() {
    orders = ModalRoute.of(context)?.settings.arguments as List<OrderModel>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          title: const Text("История заказов"),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: orders!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("Заказ №${orders![index].id}"),
                    title: Text("Сумма: ${orders![index].totalCost}"),
                    subtitle: Text(
                        "Количество товаров: ${orders![index].items.length}"),
                    trailing: InkWell(
                      onTap: () {
                        List<ItemCartModel> items = [];
                        for (var tile in orders![index].items) {
                          items.add(ItemCartModel.fromMap(tile));
                        }
                        Navigator.pushNamed(context, "/orderDetail",
                            arguments: items);
                      },
                      child: const Icon(Icons.more),
                    ),
                  );
                },
              )
            ])));
  }
}
