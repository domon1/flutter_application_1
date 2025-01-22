import 'package:flutter/material.dart';

class CategoryTabbar extends StatefulWidget {
  const CategoryTabbar({super.key});

  @override
  State<CategoryTabbar> createState() => _CategoryTabbarState();
}

class _CategoryTabbarState extends State<CategoryTabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.location_city),
            title: const Text('Coffe maker'),
            centerTitle: true,
            actions: const [
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.account_circle_outlined)),
            ],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            bottom: const TabBar(isScrollable: true, tabs: [
            Tab(text: 'Главная'),
            Tab(text: 'Новинки'),
            Tab(text: 'Кофе с молоком'),
            Tab(text: 'Черный кофе'),
            Tab(text: 'Матча и чай'),
            Tab(text: 'Какао'),
            Tab(text: 'Еда'),
          ]),
          ),
          
          body: const TabBarView(children: [
            Text('Главная'),
            Text('Новинки'),
            Text('Кофе с молоком'),
            Text('Черный кофе'),
            Text('Матча и чай'),
            Text('Какао'),
            Text('Еда'),
          ]),
        ));
  }
}
