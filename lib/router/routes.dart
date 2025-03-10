import 'package:flutter_application_1/features/pages/home_page/home_page.dart';
import 'package:flutter_application_1/features/pages/item_page/item_page_bloc.dart';
import 'package:flutter_application_1/features/pages/news_page/news_page.dart';
import 'package:flutter_application_1/features/pages/profile_page/authentification/auth_page.dart';
import 'package:flutter_application_1/features/pages/profile_page/authentification/settings_page.dart';
import 'package:flutter_application_1/features/pages/profile_page/basket/basket_page.dart';
import 'package:flutter_application_1/features/pages/profile_page/history/order_details/order_details_page.dart';
import 'package:flutter_application_1/features/pages/profile_page/history/order_history_page.dart';
import 'package:flutter_application_1/features/pages/profile_page/login/login_page.dart';
import 'package:flutter_application_1/features/pages/profile_page/login/register_page.dart';
import 'package:path/path.dart';


final routes = {
  '/': (context) => const HomePage(),
  '/item' : (context) => const ItemPage(), 
  '/news' : (context) => const NewsPage(),
  '/login' : (context) => const LoginPage(),
  '/register' : (context) => const RegisterPage(),
  '/profile' : (context) => const AuthPage(), 
  '/basket' : (context) => const BasketPage(), 
  '/profileSettings' : (context) => const SettingsPage(),
  '/history' : (context) => const OrderHistoryPage(),
  '/orderDetail' : (context) => const OrderDetailsPage()
};