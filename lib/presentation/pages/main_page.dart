import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dashboard_page.dart';
import 'news_page.dart';
import 'profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final List<Widget> pages = const [
    DashboardPage(),
    NewsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final RxInt index = 0.obs;

    return Scaffold(
      body: Obx(() => IndexedStack(
            index: index.value,
            children: pages,
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: index.value,
            onTap: (i) => index.value = i,
            selectedItemColor: const Color(0xFF0D47A1),
            unselectedItemColor: Colors.grey,
            items: _items,
          )),
    );
  }
}

List<BottomNavigationBarItem> get _items => [
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 24,
      height: 24,
      child: Image.asset('assets/icons/dashboardicon.png'),
    ),
    label: 'Dashboard',
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 24,
      height: 24,
      child: Image.asset('assets/icons/newsicon.png'),
    ),
    label: 'News',
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 24,
      height: 24,
      child: Image.asset('assets/icons/pofileicon.png'),
    ),
    label: 'Profile',
  ),
];