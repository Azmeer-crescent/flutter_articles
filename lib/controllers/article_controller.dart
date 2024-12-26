import 'package:articles/models/article.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// ArticleController
/// 
/// Fetches data from [remote API end point](https://jsonplaceholder.typicode.com/posts)
/// If you wish to replace this, make sure to update the [Article] model as well
/// Uses Future with async/await for synchronous call
/// Check the console output for any errors
class ArticleController extends GetxController {
  var articles = <Article>[].obs; //this is a state variable, ie: available to all widgets. It keeps the downloaded data.
  var isLoading = true.obs; //this is a state variable. It indicates whether the widegt is busy loading or loading is complete from remote server.

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

/**
 * fetchArticles
 * 
 * This function reads `post` records from the remote API end point. 
 * Http status code 200 means all is good. 
 * [Read here for more details:](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
 */
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
