// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import '../styles/app_colors.dart';
import 'register/signin_screen.dart';

class SplashScreen extends StatefulWidget
{
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState()
  {
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen())));
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RichText(
          text: TextSpan(text: 'Orange', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.themeColor),
            children: <TextSpan> [
              TextSpan(text:' Digital', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.textColor)),
              TextSpan(text:' center', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.textColor)),
            ],
          ),
        ),
      ),
    );
  }
}