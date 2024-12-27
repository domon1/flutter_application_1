import 'package:flutter/material.dart';
import 'type_item.dart';

class ItemCategory extends StatefulWidget {
  const ItemCategory({
    super.key,
  });

  @override
  State<ItemCategory> createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                names[index],
                style: TextStyle(
                    fontSize: 16,
                    color: category[index] ? Colors.amber : Colors.white),
              ),
            ),
            onTap: () {
              setState(() {
                for (int i = 0; i < category.length; i++) {
                  category[i] = false;
                }
                category[index] = true;
              });
            },
          );
        },
      ),
    );
  }
}
