import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../styles/app_colors.dart';
import '../../../widgets/screen_title.dart';


//This screen is details of note
class DetailsOfNoteScreen extends StatelessWidget {

  String? description;
  String? title;
  var date;


  DetailsOfNoteScreen({
    required this.description,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      appBar: AppBar(
        title: ScreenTitle(),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: AppColor.themeColor),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
              //Title
            SizedBox(height:MediaQuery.of(context).size.height * 0.1),

            Container(
              margin: const EdgeInsets.only(left:30),
              child: Text('$title', style: TextStyle(color: AppColor.textColor ,fontSize: 20)),
            ),
              //Date
            Container(
              margin: EdgeInsets.only(left:30),
              child: Text('$date', style: TextStyle(color: AppColor.textColor ,fontSize: 20)),
            ),
              //Description
            SizedBox(height:MediaQuery.of(context).size.height * 0.05),

            Container(
              margin: const EdgeInsets.only(left:30),
              child: Text('$description', style: TextStyle(color: AppColor.textColor ,fontSize: 20)),
            ),
          ],
        ),
      )
    );
  }
}
