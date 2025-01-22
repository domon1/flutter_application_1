import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/database/dbprovider.dart';
import 'package:flutter_application_1/features/database/profile_model.dart';
import 'package:flutter_application_1/repositorty/models/item_cart_model.dart';

class CoffeMakerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CoffeMakerAppBar({super.key, required this.preferredSize});

  @override
  final Size preferredSize;

  @override
  State<CoffeMakerAppBar> createState() => _CoffeMakerAppBarState();
}

class _CoffeMakerAppBarState extends State<CoffeMakerAppBar> {
  List<ProfileModel> _profiles = [];
  List<ItemCartModel> _items = [];

  @override
  void initState() {
    super.initState();
    _fetchProfiles();
  }

  Future<void> _fetchProfiles() async {
    final userMaps = await DBProvider.instance.queryAllUsers();
    final itemsMap = await DBProvider.instance.queryAllItems();
    setState(() {
      _profiles =
          userMaps.map((userMap) => ProfileModel.fromMap(userMap)).toList();
      _items =
          itemsMap.map((itemMap) => ItemCartModel.fromMap(itemMap)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
          onTap: () {
            _fetchProfiles();
            if (_profiles.isNotEmpty) {
              if (_items.isNotEmpty){
                Navigator.pushNamed(context, "/basket", arguments: _items);
              } else {
                _items = [];
                Navigator.pushNamed(context, "/basket", arguments: _items);
              }
            } else {
              Navigator.pushNamed(context, "/login");
            }
          },
          child: const Icon(Icons.shopping_cart)),
      title: const Text('Coffe maker'),
      centerTitle: true,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () {
                  _fetchProfiles();
                  if (_profiles.isNotEmpty) {
                    Navigator.pushNamed(context, "/profile",
                        arguments: _profiles);
                  } else {
                    Navigator.pushNamed(context, "/login");
                  }
                },
                child: const Icon(Icons.account_circle_outlined))),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
    );
  }
}
