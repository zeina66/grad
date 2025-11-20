import 'package:flutter/material.dart';
import 'package:graduation_project/core/routes/app_routes.dart';
import 'package:graduation_project/core/theme/app_colors.dart';


class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor:AppColors.primary,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, AppRoutes.city);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, AppRoutes.order);
            break;
          case 3:
            Navigator.pushReplacementNamed(context, AppRoutes.profile);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.location_city), label: 'City'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Order'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
