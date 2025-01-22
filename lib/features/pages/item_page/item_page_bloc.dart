import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/pages/item_page/bloc/item_bloc.dart';
import 'package:flutter_application_1/features/pages/item_page/item_page_widget.dart';
import 'package:flutter_application_1/repositorty/repository_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


class ItemPage extends StatefulWidget {
  const ItemPage({super.key}); 

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final _itemBlock = ItemBloc(GetIt.I<AbstractRepository<ItemListModel, ItemModel>>());
  int? id;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as int;
    _itemBlock.add(ItemLoad(id: id!));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ItemBloc, ItemState>(
        bloc: _itemBlock,
        builder: (context, state) {
          if (state is ItemLoaded){
            return ItemPageWidget(item: state.item);
          }else if (state is ItemLoadingFailture) {
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Ошибка загрузки ...'),
              const SizedBox(height: 20,),
              TextButton(onPressed: (){
                _itemBlock.add(ItemLoad(id: ModalRoute.of(context)?.settings.arguments as int));
              }, child: const Text('Попробовать снова'))
            ],
          ));
        }
        return const Center(child: CircularProgressIndicator());
        },
      )
      );
  }
}

