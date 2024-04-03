class ArticleModel {
  final String? image;
  final String? title;
  final String? description;
  final String? url;
  final String? author;
  ArticleModel(
      {required this.image,
      required this.author,
      required this.title,
      required this.description,
      required this.url});
  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      url: json['url'] ?? "",
      image: json['urlToImage'] ??
          'https://img.freepik.com/free-psd/3d-rendering-ui-icon_23-2149182289.jpg',
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No description",
      author: json['author'] ?? "No author",
    );
  }
}
