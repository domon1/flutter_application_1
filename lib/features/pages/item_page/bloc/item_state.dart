part of 'item_bloc.dart';

abstract class ItemState {}

class ItemInitial extends ItemState{}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  ItemLoaded({required this.item});

  final ItemModel item;
}

class ItemLoadingFailture extends ItemState {
  ItemLoadingFailture({required this.exeption});

  final Object? exeption;
}