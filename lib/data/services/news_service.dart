import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:ragdanews/core/constants/api_constants.dart';

import 'package:ragdanews/data/models/article.dart';

class NewsService {
  Future<NewsResponse> getTopHeadlines() async {
    final url = newsApiBaseUrl;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news');
    }
  }
}