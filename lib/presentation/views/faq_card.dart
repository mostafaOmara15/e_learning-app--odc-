import 'package:flutter/material.dart';

class FAQCard extends StatelessWidget {

  String quistion;
  String answer;

  FAQCard({required this.quistion, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          title: Text("$quistion", 
          style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
          iconColor: Colors.black,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text("$answer",style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              ),
            )
          ],     
        ),
      )
    );
  }
}