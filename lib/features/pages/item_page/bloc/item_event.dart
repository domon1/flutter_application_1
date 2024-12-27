part of 'item_bloc.dart';

abstract class ItemEvent {}

class ItemLoad extends ItemEvent {
  ItemLoad({required this.id});
  final int id;
}