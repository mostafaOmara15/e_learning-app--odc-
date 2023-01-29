import 'package:flutter/cupertino.dart';

class HomeCardModel 
{
  String title;
  IconData icon;
  Widget screen;

  HomeCardModel({
    required this.icon,
    required this.screen,
    required this.title
  });    
}