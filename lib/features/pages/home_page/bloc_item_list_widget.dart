import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/pages/home_page/bloc/item_list/item_list_bloc.dart';
import 'package:flutter_application_1/features/pages/home_page/scrolls/item_horizontal_scroll.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocItemList extends StatelessWidget {
  const BlocItemList({
    super.key,
    required ItemListBloc itemListBlock,
  }) : _itemListBlock = itemListBlock;

  final ItemListBloc _itemListBlock;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListBloc, ItemListState>(
      bloc: _itemListBlock,
      builder: (context, state) {
        if (state is ItemListLoaded) {
          return ItemScrollHorizontal(items: state.itemList);
        } else if (state is ItemListLoadingFailture) {
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Ошибка загрузки ...'),
              const SizedBox(height: 20,),
              TextButton(onPressed: (){
                _itemListBlock.add(ItemListLoad());
              }, child: const Text('Попробовать снова'))
            ],
          ));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}