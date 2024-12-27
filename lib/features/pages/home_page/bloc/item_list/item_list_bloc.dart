import 'package:flutter_application_1/repositorty/repository_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'item_list_state.dart';
part 'item_list_event.dart';

class ItemListBloc extends Bloc<ItemListEvent, ItemListState> {
  ItemListBloc(this.abstractItemRepository) : super(ItemListInitial()) {
    on<ItemListLoad>((event, emit) async {
      try {
        emit(ItemListLoading());
        final itemList = await abstractItemRepository.getAllItem();
        emit(ItemListLoaded(itemList: itemList as List<ItemListModel>));
      } catch (e, st) {
        emit(ItemListLoadingFailture(exeption: e));
        GetIt.I<Talker>().handle(e, st);
      }
    });
  }

  final AbstractRepository abstractItemRepository;
}