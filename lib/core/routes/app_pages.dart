import 'package:get/get.dart';
import 'package:ragdanews/presentation/pages/splash_page.dart';
import 'package:ragdanews/presentation/pages/login_page.dart';
import 'package:ragdanews/presentation/pages/main_page.dart';
import 'package:ragdanews/presentation/pages/register_page.dart';
import 'package:ragdanews/presentation/pages/article_detail_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage()),
    GetPage(name: AppRoutes.login,  page: () => LoginPage()),
    GetPage(name: AppRoutes.register, page: () => RegisterPage()),
    GetPage(name: AppRoutes.main,   page: () => const MainPage(), transition: Transition.fadeIn),
    GetPage(name: AppRoutes.articleDetail, page: () => ArticleDetailPage(url: Get.parameters['url'] ?? '')),
  ];
}