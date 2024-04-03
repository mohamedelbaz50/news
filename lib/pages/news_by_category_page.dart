import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_item.dart';

class NewsByCategoryPage extends StatefulWidget {
  final String category;
  const NewsByCategoryPage({super.key, required this.category});

  @override
  State<NewsByCategoryPage> createState() => _NewsByCategoryPageState();
}

var futureData;

class _NewsByCategoryPageState extends State<NewsByCategoryPage> {
  @override
  void initState() {
    super.initState();
    futureData =
        NewsService(Dio()).getNewsByCategory(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder<List<ArticleModel>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return NewsByCategoryListView(
                      articles: snapshot.data!,
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('oops  was an error, try later'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.blue,
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}

class NewsByCategoryListView extends StatelessWidget {
  final List<ArticleModel> articles;
  const NewsByCategoryListView({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          var model = articles[index];
          return NewsItem(
            model: model,
          );
        });
  }
}
