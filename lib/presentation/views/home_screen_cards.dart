// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../../models/home_card_model.dart';
import '../styles/app_colors.dart';

class HomeScreenCard extends StatelessWidget {
  HomeCardModel card;
  HomeScreenCard({required this.card});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade300,
                child: Icon(card.icon, color: AppColor.themeColor,size: 35,),
              ),
              Text("${card.title}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColor.themeColor)),
            ]
          )
        ),
        onTap:() => Navigator.push(context, MaterialPageRoute(builder: ((context) => card.screen))),
      ),
    );
  }
}


