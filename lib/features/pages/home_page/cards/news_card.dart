import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositorty/models/news_list_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
  });

  final NewsListModel news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/news", arguments: news.id);
      },
      child: Card(
        elevation: 20,
        color: Colors.white.withOpacity(0.1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: const EdgeInsets.only(right: 10),
        child: SizedBox(
          height: double.infinity,
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: Image.asset(
                        "assets/images/${news.imageName}",
                        fit: BoxFit.cover,
                      )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          news.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
