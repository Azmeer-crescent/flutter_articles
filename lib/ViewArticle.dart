import 'package:articles/Article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewArticle extends StatelessWidget {
  const ViewArticle({super.key});

  @override
  Widget build(BuildContext context) {
    final article = Get.arguments as Article;

    return Scaffold(
      appBar: AppBar(
        title: Text('View an Article'),
      ),
      body: Card(
        elevation: 4.0, // Set the elevation for the card shadow
        margin: EdgeInsets.all(16.0), // Set the margin around the card
        child: Column(
          children: [
            ListTile(
              title: Text(article.title),
              subtitle: Text(article.id.toString()),
              leading: Icon(Icons.book),
            ),
            Divider(), // Add a divider between the ListTile and other content
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                article.body,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
