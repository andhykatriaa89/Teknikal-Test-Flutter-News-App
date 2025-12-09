import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), backgroundColor: const Color.fromRGBO(83, 157, 243, 1)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(radius: 60, backgroundImage: AssetImage('assets/images/profile.jpg')),
          const SizedBox(height: 16),
          const Text('Hasan Waulat', textAlign: TextAlign.center, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const Text('Departemen A', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
          const Divider(height: 50),

          _menuItem('Personal Information', Icons.person),
          _menuItem('Password & Security', Icons.lock),
          _menuItem('Salary Slip Summary', Icons.attach_money),
          _menuItem('Leave Summary', Icons.event_note),
          _menuItem('Overtime Summary', Icons.access_time),
          _menuItem('Annual Tax Return PPH21', Icons.description),

          _menuItem('Other', Icons.more_horiz),
          
          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () => Get.dialog(
              AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                content: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.logout, size: 80, color: Colors.blue[700]),
                  const SizedBox(height: 20),
                  const Text('Logout?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const Text('Are you sure you want to logout?'),
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () => Get.offAllNamed(AppRoutes.login),
                      child: const Text('Logout', style: TextStyle(color: Colors.white)),
                    ),
                  ]),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}