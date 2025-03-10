import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/database/dbprovider.dart';
import 'package:flutter_application_1/features/database/profile_model.dart';
import 'package:flutter_application_1/repositorty/models/order_model.dart';
import 'package:flutter_application_1/repositorty/order_repository.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<ProfileModel>? _profiles;

  @override
  void didChangeDependencies() {
    _profiles =
        ModalRoute.of(context)!.settings.arguments as List<ProfileModel>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: const Text('Настройки'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () => Navigator.pushNamed(context, '/'),
              child: const Icon(Icons.close_rounded))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black26),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Имя'),
                              Text(_profiles![0].name)
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Номер телефона'),
                              Text(_profiles![0].username)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: double.infinity,
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black26),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                              onPressed: () async {
                                OrderRepository orderRepository = OrderRepository(dio: Dio());
                                List<OrderModel> orders = await orderRepository.getOrderByUsername(_profiles![0].username);                               
                                Navigator.pushNamed(context, "/history", arguments: orders);
                              },
                              child: const Text("История заказов")),
                        ))),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black26),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('О приложении'),
                              Icon(Icons.info_outline)
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Напиши нам'),
                              Icon(Icons.message_outlined)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black26),
                    child: TextButton(
                        onPressed: () {
                          DBProvider.instance.deleteAllItems();
                          DBProvider.instance.deleteUser();
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/", (Route<dynamic> route) => false);
                        },
                        child: const Text('Выход')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
