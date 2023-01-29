import 'package:flutter/material.dart';
import '../styles/app_colors.dart';

class ScreenTitle extends StatelessWidget {
  String? title;
  ScreenTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return title == null
      ? RichText(
          text: TextSpan( text: 'Orange', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.themeColor),
            children: <TextSpan> [
              TextSpan(text:' Digital', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.textColor)),
              TextSpan(text:' center', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.textColor)),
            ],
          ),
        )
      : Text("$title", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.textColor)
    );
  }
}