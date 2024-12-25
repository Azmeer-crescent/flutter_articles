/// Article data object
/// 
/// Also known as structure or schema. 
/// Also contains [Article.fromJson] factory method
class Article {
  final int id;
  final String title;
  final String body;

  const Article({required this.id, required this.title, required this.body});

  /// Factory method to create an instance of Article from JSON data
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
