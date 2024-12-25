import 'package:articles/Article.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticleController extends GetxController {
  var articles = <Article>[].obs;
  // var articles = <String>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // Example API
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        articles.value =
            data.map((article) => Article.fromJson(article)).toList();
      } else {
        print('Failed to fetch data');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
