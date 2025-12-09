import 'package:get/get.dart';

import 'package:ragdanews/data/models/article.dart';

import 'package:ragdanews/data/services/news_service.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var errorMsg = ''.obs;
  var articles = <Article>[].obs;

  final NewsService _newsService = NewsService();

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      final response = await _newsService.getTopHeadlines();
      articles.assignAll(response.articles);
    } catch (e) {
      errorMsg(e.toString());
    } finally {
      isLoading(false);
    }
  }
}