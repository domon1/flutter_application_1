import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorty/models/item_cart_model.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  List<ItemCartModel>? items;

  @override
  void didChangeDependencies() {
    items = ModalRoute.of(context)?.settings.arguments as List<ItemCartModel>;
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
                itemCount: items!.length,
                itemBuilder: (context, index) {
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
                        Text("Количество: ${items![index].count}")
                      ],
                    ),
                  );
                },
              )
            ])));
  }
}
