import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/routes.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CofferMakerApp extends StatefulWidget {
  const CofferMakerApp({super.key});

  @override
  State<CofferMakerApp> createState() => _CofferMakerAppState();
}

class _CofferMakerAppState extends State<CofferMakerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Coffe Maker',
        debugShowCheckedModeBanner: false,
        theme: theme,
        navigatorObservers: [TalkerRouteObserver(GetIt.I<Talker>())],
        routes: routes
        );
  }
}