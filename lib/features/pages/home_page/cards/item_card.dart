import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorty/models/item_list_model.dart';

class ItemCard extends StatelessWidget {
  final ItemListModel item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/item", arguments: item.id);
      },
      child: Card(
        elevation: 20,
        color: Colors.white.withOpacity(0.1),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: const EdgeInsets.only(right: 10),
        child: Container(
          padding: const EdgeInsets.all(15),
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Stack(
                    children: [Positioned.fill(child: Image.asset("assets/images/${item.imageName}", fit: BoxFit.cover,)),],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Text(item.name, style: Theme.of(context).textTheme.labelMedium,),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${item.cost} ₽',style:Theme.of(context).textTheme.labelMedium,),
                  const Icon(CupertinoIcons.right_chevron,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}