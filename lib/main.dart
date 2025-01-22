import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/coffee_maker_app.dart';
import 'package:flutter_application_1/features/database/dbprovider.dart';
import 'package:flutter_application_1/repositorty/item_repository.dart';
import 'package:flutter_application_1/repositorty/models/news_list_model.dart';
import 'package:flutter_application_1/repositorty/news_repository.dart';
import 'package:flutter_application_1/repositorty/repository_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  final talker = TalkerFlutter.init();

  final dio = Dio();

  dio.interceptors.add(TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseHeaders: true,
        printResponseMessage: true,
      )
    )
  );

  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider.instance.initDb();

  Bloc.observer = TalkerBlocObserver();
  GetIt.I.registerSingleton(talker);
  GetIt.I.registerLazySingleton<AbstractRepository<ItemListModel, ItemModel>>(() => ItemRepository(dio: dio));
  GetIt.I.registerLazySingleton<AbstractRepository<NewsListModel, ItemModel>>(() => NewsRepository(dio: dio));

  runApp(const CofferMakerApp());
}
