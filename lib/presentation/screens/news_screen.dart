import 'package:flutter/material.dart';

import '../views/news_card_item.dart';


class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        /// TODO: Get data form API.
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => const NewsCardItem(),
        ),
      ),
    );
  }
}


