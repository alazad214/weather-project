import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_project/widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("আবহাওয়ার খবর"),
        titleSpacing: 0,
      ),
      body: const SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              NewsCard(),
            ],
          )
        ),
      )

    );
  }
}
