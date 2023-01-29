// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../styles/app_colors.dart';
import '../../widgets/screen_title.dart';

class PartnerScreen extends StatelessWidget {
  const PartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: ScreenTitle(title: "Our Partners"),
        centerTitle: true,
        leading: BackButton(color: AppColor.themeColor),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height*0.15,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.grey,Colors.white,Colors.grey,],
                  ),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan( text: 'Orange', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.orange),
                    children: const <TextSpan> [
                      TextSpan(text:' Digital', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
                      TextSpan(text:' center', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
                    ]),
                  ),
                )
              ),
              onTap: _launchURL,
            ),
          ],
        ),
      ),
    );
  }
}

  _launchURL() async {
    const url = 'https://www.orangedigitalcenters.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }