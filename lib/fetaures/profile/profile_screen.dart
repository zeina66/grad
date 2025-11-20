import 'package:flutter/material.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/core/widgets/custom_bottom_nav.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: AppColors.primary,
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 3),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Zeina Esam', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('zeinaesam@email.com'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text('Account Settings', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),


            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.lock, color: AppColors.primary),
                    title: Text('Change Password'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.notifications,color: AppColors.primary),
                    title: Text('Notifications'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.help, color: AppColors.primary),
                    title: Text('Help & Support'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text('Logout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
