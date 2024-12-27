import 'package:flutter/material.dart';

// TODO Переписать под новые карточки напитков/еды

class ItemGridScroll extends StatelessWidget {
  const ItemGridScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: List.generate(10, (index) {
              return Container();
            }),
          ),
        );
  }
}