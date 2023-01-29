import 'package:flutter/material.dart';
import '../../models/lecture_model.dart';
import '../styles/app_colors.dart';

class LectureCard extends StatelessWidget {
  LecturModel lecture;
  LectureCard({required this.lecture});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),

      child: Container(
        height: MediaQuery.of(context).size.height*0.15,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(lecture.title, style: TextStyle(color:  AppColor.textColor, fontSize: 22, fontWeight: FontWeight.bold),),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.timer, size: 18, color: AppColor.textColor,),
                      ),
                      TextSpan(text:" ${lecture.duration}hr", style: TextStyle(color: AppColor.textColor,fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Exam Date",style: TextStyle(color: AppColor.supWidgetColor,fontWeight: FontWeight.bold, fontSize: 15)),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.calendar_month, size: 18, color: AppColor.textColor,),
                          ),
                          TextSpan(text:"${lecture.date}", style: TextStyle(color: AppColor.textColor,fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    )
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Start Time",style: TextStyle(color: AppColor.supWidgetColor,fontWeight: FontWeight.bold, fontSize: 15)),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.access_time_filled_rounded,color:Colors.green,),
                          ),
                          TextSpan(text:"${lecture.startTime}", style: TextStyle(color: AppColor.textColor,fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    )
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("End Time",style: TextStyle(color: AppColor.supWidgetColor,fontWeight: FontWeight.bold, fontSize: 15)),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.access_time_filled_rounded,color:Colors.red,),
                          ),
                          TextSpan(text:"${lecture.endTime}", style: TextStyle(color: AppColor.textColor,fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}