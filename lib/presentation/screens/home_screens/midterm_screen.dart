import 'package:flutter/material.dart';
import '../../../models/lecture_model.dart';
import '../../styles/app_colors.dart';
import '../../views/midterm_container.dart';
import '../../widgets/screen_title.dart';

class MidtermsScreen extends StatelessWidget {
  const MidtermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScreenTitle(title: "Midterm"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: AppColor.themeColor),
      ),
      body: Center(child: Text("There's No Data To Show",style: TextStyle( fontSize: 26,  color: Colors.black))),
    );
  }
}