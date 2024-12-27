import 'package:flutter_application_1/repositorty/abstract_item_repository.dart';
import 'package:flutter_application_1/repositorty/models/item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc(this.abstractRepository) : super(ItemInitial()) {
    on<ItemLoad>((event, emit) async {
        final item = await abstractRepository.getItemById(event.id);
        emit(ItemLoaded(item: item) as ItemState);
    });
  }

  final AbstractRepository abstractRepository;
}