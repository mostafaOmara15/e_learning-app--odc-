import 'package:flutter/material.dart';

import '../../../models/lecture_model.dart';
import '../../styles/app_colors.dart';
import '../../views/midterm_container.dart';
import '../../widgets/screen_title.dart';


class LecturesScreen extends StatelessWidget {
  LecturesScreen({Key? key}) : super(key: key);

  List lecturesDummyData = <LecturModel>[
    LecturModel(
      title: 'Flutter',
      duration: '3HRs',
      date: '19-08-2022',
      startTime: '12:00 PM',
      endTime: '2:00 PM'
    ),
    LecturModel(
      title: 'React',
      duration: '3HRs',
      date: '8-08-2022',
      startTime: '1:00 PM',
      endTime: '2:00 PM'
    ),
    LecturModel(
      title: 'Ionic',
      duration: '4HRs',
      date: '18-08-2022',
      startTime: '12:00 PM',
      endTime: '2:00 PM'
    ),
    LecturModel(
      title: 'Xamarin',
      duration: '4HRs',
      date: '18-08-2022',
      startTime: '12:00 PM',
      endTime: '2:00 PM'
    ),
    LecturModel(
      title: 'Android',
      duration: '4HRs',
      date: '18-08-2022',
      startTime: '12:00 PM',
      endTime: '2:00 PM'
    ),
  ];

  /// TODO: Get data form API.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ScreenTitle(title: "Lectures"),
        elevation: 0,
        leading: BackButton(color: AppColor.themeColor),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return LectureCard(lecture: lecturesDummyData[index],);
        },
        itemCount: lecturesDummyData.length,
      ),
    );
  }
}
