import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/Get.dart';
import '../controllers/news_controller.dart';
import '../../core/routes/app_routes.dart';
import '../../data/models/article.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsCtrl = Get.put(NewsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking News'),
        backgroundColor: const Color.fromRGBO(83, 157, 243, 1),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        if (newsCtrl.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (newsCtrl.errorMsg.value.isNotEmpty) {
          return Center(child: Text('Error: ${newsCtrl.errorMsg.value}'));
        } else if (newsCtrl.articles.isEmpty) {
          return const Center(child: Text('No news available'));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: newsCtrl.articles.length,
            itemBuilder: (_, i) {
              final article = newsCtrl.articles[i];
              if (i == 0) {
                return _buildFeaturedArticle(article);
              } else {
                return _buildArticleCard(article);
              }
            },
          );
        }
      }),
    );
  }
}

Widget _buildFeaturedArticle(Article article) {
  return GestureDetector(
    onTap: () => Get.toNamed(AppRoutes.articleDetail, parameters: {'url': article.url ?? ''}),
    child: Stack(
      children: [
        CachedNetworkImage(
          imageUrl: article.urlToImage ?? 'https://picsum.photos/seed/news/600/400',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.black.withOpacity(0.5),
            child: Text(
              article.title ?? '',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildArticleCard(Article article) {
  return GestureDetector(
    onTap: () => Get.toNamed(AppRoutes.articleDetail, parameters: {'url': article.url ?? ''}),
    child: Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? 'https://picsum.photos/seed/news/150/100',
              width: 120,
              height: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? '',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    article.description ?? '',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage('https://picsum.photos/seed/${article.author ?? "author"}/24/24'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          article.author ?? 'Unknown',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      Text(
                        article.publishedAt ?? '',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}