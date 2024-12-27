import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/pages/home_page/cards/item_card.dart';
import 'package:flutter_application_1/repositorty/models/item_list_model.dart';

class ItemScrollHorizontal extends StatelessWidget {
  
  const ItemScrollHorizontal({super.key, required this.items});

  final List<ItemListModel> items;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ItemCard(item: items[index]);
        },
      ),
    );
  }
}