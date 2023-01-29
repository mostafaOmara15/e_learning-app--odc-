import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_odc/presentation/screens/setting_screen.dart';
import '../styles/app_colors.dart';
import 'home_screen.dart';
import 'news_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  
  static  List<Widget> widgetOptions = [
    HomeScreen(),
    NewsScreen(),
    SettingsScreen(),
  ];

  @override
  

  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
      ),

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => 
          setState(() {
          selectedIndex = index;
        }),

        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: AppColor.themeColor,
            inactiveColor: AppColor.supWidgetColor
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.newspaper),
            title: Text('News'),
            activeColor: AppColor.themeColor,
            inactiveColor: AppColor.supWidgetColor
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: AppColor.themeColor,
            inactiveColor: AppColor.supWidgetColor
          ),
        ],
      )
    );
  }
}