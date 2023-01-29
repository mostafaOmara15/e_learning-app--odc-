import 'package:flutter/material.dart';
import '../../styles/app_colors.dart';
import '../../views/faq_card.dart';
import '../../widgets/screen_title.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: ScreenTitle(title: "FAQ"),
        centerTitle: true,
        leading: BackButton(color: AppColor.themeColor),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: 
            FAQCard(
              quistion: "Q1: How many countries Orange Digital center is in ?",
              answer: "16 country",
            ),
          ),
        ],
      ),
    );
  }
}


