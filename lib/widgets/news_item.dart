import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  final ArticleModel model;
  const NewsItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrl(Uri.parse(model.url!));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 0)),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        height: MediaQuery.sizeOf(context).height / 5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(model.title!,
                      textAlign: TextAlign.left,
                      maxLines: 3,
                      style: GoogleFonts.asap(
                          height: 1.2,
                          fontSize: 14,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    model.description!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.asap(
                        height: 1.1, fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          model.author!,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.cairo(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width / 3,
              height: MediaQuery.sizeOf(context).height / 5.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(model.image!))),
            )
          ],
        ),
      ),
    );
  }
}
