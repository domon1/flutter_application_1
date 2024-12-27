import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/pages/home_page/home_page.dart';
import 'package:flutter_application_1/features/pages/item_page/item_page_bloc.dart';
import 'package:flutter_application_1/features/pages/news_page/news_page.dart';


final routes = {
  '/': (context) => const HomePage(),
  '/item' : (context) => const ItemPage(), 
  '/news' : (context) => const NewsPage(),
  '/basket' : (context) => const Text('Item page'), 
  '/profile' : (context) => const Text('Item page'), 
};