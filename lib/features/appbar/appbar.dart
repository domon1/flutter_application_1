import 'package:flutter/material.dart';

class CoffeMakerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoffeMakerAppBar({
    super.key,
    required this.preferredSize
  });

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
    );
  }
}
