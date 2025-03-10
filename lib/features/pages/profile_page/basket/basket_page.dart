import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/database/dbprovider.dart';
import 'package:flutter_application_1/features/database/profile_model.dart';
import 'package:flutter_application_1/repositorty/models/item_cart_model.dart';
import 'package:flutter_application_1/repositorty/order_repository.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  List<ItemCartModel>? items;
  int total = 0;

  @override
  void didChangeDependencies() {
    items = ModalRoute.of(context)?.settings.arguments as List<ItemCartModel>;
    super.didChangeDependencies();
  }

  int getTotal() {
    var tot = items!.fold<int>(0, (sum, item) => sum + item.cost*item.count);
    return tot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text("Корзина"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: items!.length,
              itemBuilder: (context, index) {
                if (items!.isNotEmpty) {
                  return ListTile(
                    leading:
                        Image.asset("assets/images/${items![index].imageName}"),
                    title: Text(items![index].name),
                    subtitle: Row(
                      children: [
                        Text("${items![index].cost}₽"),
                        const SizedBox(
                          width: 15,
                        ),
                        Text("${items![index].count}")
                      ],
                    ),
                    trailing: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                DBProvider.instance
                                    .deleteItem(items![index].id);
                                items!.remove(items![index]);
                              });
                            },
                            child: const Icon(Icons.close)),
                        InkWell(
                          onTap: () {
                              setState(() {
                                if (items![index].count > 1) {
                                  ItemCartModel model = ItemCartModel(
                                  id: items![index].id, 
                                  name: items![index].name, 
                                  imageName: items![index].imageName, 
                                  cost: items![index].cost, 
                                  count: items![index].count - 1
                                );
                                DBProvider.instance.updateItem(model);
                                }
                              });
                            },
                            child: const Icon(Icons.remove)
                        ),
                        InkWell(
                          onTap: () {
                              setState(() {
                                ItemCartModel model = ItemCartModel(
                                  id: items![index].id, 
                                  name: items![index].name, 
                                  imageName: items![index].imageName, 
                                  cost: items![index].cost, 
                                  count: items![index].count + 1
                                );
                                DBProvider.instance.updateItem(model);
                              });
                            },
                            child: const Icon(Icons.add)
                        )
                      ],
                    ),
                  );
                }
                return const Text('Вы ничего не выбрали!');
              }),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Итого'), Text('${getTotal()} ₽')],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () async {
                List<Map<String, dynamic>> userMaps =
                    await DBProvider.instance.queryAllUsers();
                List<ProfileModel> profile = userMaps
                    .map((userMap) => ProfileModel.fromMap(userMap))
                    .toList();
                OrderRepository orderRepository = OrderRepository(dio: Dio());
                await orderRepository.sendOrder(profile[0].username, items!);
                DBProvider.instance.deleteAllItems();
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (Route<dynamic> route) => false);
              },
              child: const Text('Заказать'))
        ]),
      ),
    );
  }
}
