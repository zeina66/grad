import 'package:flutter/material.dart';
import 'package:graduation_project/fetaures/city/city_screen.dart';
import 'package:graduation_project/fetaures/home/presentation/home_screen.dart';
import 'package:graduation_project/fetaures/order/order_screen.dart';
import 'package:graduation_project/fetaures/profile/profile_screen.dart';

class AppRoutes {
  static const home = '/';
  static const city = '/city';
  static const order = '/order';
  static const profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case city:
        return MaterialPageRoute(builder: (_) => const CityScreen());
      case order:
        return MaterialPageRoute(builder: (_) => const OrderScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }
}
