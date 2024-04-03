import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/categories_model.dart';
import 'package:news_app/pages/search_page.dart';
import 'package:news_app/widgets/category_item.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<CategoriesModel> categoriesList = [
    CategoriesModel(
      label: "Sports",
      image: "assets/images/sport.png",
      color: Colors.red,
      endPoint: 'sports',
    ),
    CategoriesModel(
        label: "Health",
        image: "assets/images/health.png",
        color: Colors.green,
        endPoint: 'health'),
    CategoriesModel(
        label: "Science",
        image: "assets/images/science.png",
        color: Colors.blue,
        endPoint: 'science'),
    CategoriesModel(
        label: "Business",
        image: "assets/images/business.png",
        color: Colors.orangeAccent,
        endPoint: 'business'),
    CategoriesModel(
        label: "Entertainment",
        image: "assets/images/entertainment.png",
        color: Colors.indigo,
        endPoint: 'entertainment'),
    CategoriesModel(
        label: "Technology",
        image: "assets/images/technology.png",
        color: Colors.purpleAccent,
        endPoint: 'technology')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News App",
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()));
                },
                icon: const Icon(
                  Icons.search,
                  size: 25,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pick your favourite intersted  \nof Category",
              style:
                  GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1, crossAxisCount: 2),
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    var model = categoriesList[index];
                    return CategoryItem(
                      index: index,
                      model: model,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
