import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {

  String title;
  Widget screen;

  SettingListTile({required this.title, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text("$title", style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            trailing: Icon(Icons.navigate_next, color: Colors.black, size: 35),

          onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => screen)))
        ),
      )
    );
  }
}