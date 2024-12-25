import 'package:articles/ViewArticle.dart';
import 'controllers/article_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListArticles extends StatelessWidget {
  const ListArticles({super.key});

  @override
  Widget build(BuildContext context) {
    final ArticleController controller = Get.put(ArticleController());

    return Scaffold(
        appBar: AppBar(
          title: Text('Article list'),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.articles.isEmpty) {
            return Center(child: Text('No data available.'));
          } else {
            return ListView.builder(
              itemCount: controller.articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.articles[index].title),
                  subtitle: Text('sub title here'),
                  onTap: () {
                    Get.to(ViewArticle(),
                        arguments: controller.articles[index]);
                  },
                );
              },
            );
          }
        }));
  }
}
