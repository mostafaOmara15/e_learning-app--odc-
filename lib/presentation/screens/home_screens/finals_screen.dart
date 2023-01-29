import 'package:flutter/material.dart';
import '../../styles/app_colors.dart';
import '../../widgets/screen_title.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScreenTitle(title: "Finals"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: AppColor.themeColor),
      ),
      body: Center(child: Text("There's No Data To Show",style: TextStyle( fontSize: 26,  color: Colors.black))),
    );
  }
}