part of 'item_list_bloc.dart';

abstract class ItemListState {}

class ItemListInitial extends ItemListState {}

class ItemListLoading extends ItemListState {}

class ItemListLoaded extends ItemListState {
  ItemListLoaded({required this.itemList});
  
  final List<ItemListModel> itemList;
}

class ItemListLoadingFailture extends ItemListState {
  ItemListLoadingFailture({required this.exeption});

  final Object? exeption;
}
