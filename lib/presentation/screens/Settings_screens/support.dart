import 'package:flutter/material.dart';

import '../../widgets/app_textFields.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

TextEditingController nameCtrl = TextEditingController();
TextEditingController emailCtrl = TextEditingController();
TextEditingController descriptionCtrl = TextEditingController();


class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Support", style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [              
              AppTextField(fieldCtrl: nameCtrl, lable: "Name", isSecured: false, withIcon: false,isNumField: false),
              AppTextField(fieldCtrl: emailCtrl, lable: "Email", isSecured: false, withIcon: false, isNumField: false),
      
              TextField(
                controller: descriptionCtrl,
                maxLines: 5,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange,),
                  borderRadius: BorderRadius.circular(20)
                ),
                  
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)
                ),
                            
                labelText: "Description",
                labelStyle: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
                  floatingLabelStyle: TextStyle(color: Colors.deepOrange,fontSize: 18, fontWeight: FontWeight.bold),                            
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}