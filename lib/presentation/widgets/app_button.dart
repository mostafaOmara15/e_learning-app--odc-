import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

Widget CustomButton ({
  required String title,
  required bool border
}) => Container(
  child: Center(
    child: Text(
      title, 
      style: TextStyle(
        color: border == true
        ? AppColor.themeColor
        :Colors.white,
        fontSize: 18, fontWeight: FontWeight.bold))),
        
  padding: EdgeInsets.all(20),
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: border == false?AppColor.themeColor
    :null,
    border: Border.all(color: AppColor.themeColor, width: 3)
  ),
);