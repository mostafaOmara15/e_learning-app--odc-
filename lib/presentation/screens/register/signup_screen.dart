// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/auth/register/register_cubit.dart';
import '../../styles/app_colors.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_textFields.dart';
import '../../widgets/screen_title.dart';
import 'signin_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController nameCtrl = TextEditingController();
TextEditingController emailCtrl = TextEditingController();
TextEditingController passwordCtrl = TextEditingController();
TextEditingController confirmPassCtrl = TextEditingController();
TextEditingController phoneCtrl = TextEditingController();

bool showPass = true;
bool showconfirmPass = true;

final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

List<DropdownMenuItem<String>> genderMenu = const [
  DropdownMenuItem(value: 'm', child: Text('Male')),
  DropdownMenuItem(value: 'f', child: Text('Female')),
];

String gender = 'm';
void changeGender(val) {
  gender = val;
}
var genderSelected = "Select gender";

List<String> genderList = <String>['Male','Female'];
String genderdropdownValue = genderList.first;

List<String> universityList = <String>['AUC','ASU'];
String universitydropdownValue = universityList.first;

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => SignInScreen()),
          (route) => false);
        }
      },

      builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: ScreenTitle(),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0
        ),
    
        body: Form(
          key: registerKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign Up", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.textColor)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            
                  AppTextField(
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Name';
                      } else if (value.length > 32) {
                        return 'Name Must be less than 32 characters';
                      }
                    },
                    fieldCtrl: nameCtrl, 
                    lable: "Name", 
                    isSecured: false, 
                    withIcon: false,
                    isNumField: false
                  ),

                  AppTextField(
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!RegExp(
                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                          .hasMatch(value)) {
                        return 'Please Enter Valid as example@gmail.com';
                      }
                    },
                    fieldCtrl: emailCtrl,
                    lable: "Email", 
                    isSecured: false, 
                    withIcon: false, isNumField: false
                  ),

                  AppTextField(
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                    },
                    fieldCtrl: passwordCtrl, 
                    lable: "Password", 
                    isSecured: showPass, 
                    withIcon: true, 
                    isNumField: false,
                    showPass: () {
                      setState(() {
                        showPass =! showPass;
                      });
                    },
                  ),

                  AppTextField(
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Confirm Password';
                      }
                    },
                    fieldCtrl: confirmPassCtrl, 
                    lable: "Confirm Password", 
                    isSecured: showconfirmPass, 
                    withIcon: true, 
                    isNumField: false,
                    showPass: () {
                      setState(() {
                        showconfirmPass =! showconfirmPass;
                      });
                    },
                   ),

                  AppTextField(
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Your Phone Number';
                      } else if (value.length != 11) {
                        return "Phone Number Must be 11 Number";
                      }
                    },
                    fieldCtrl: phoneCtrl, 
                    lable: "Phone Number", 
                    isSecured: false, 
                    withIcon: false, 
                    isNumField: true
                  ),
            
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Column(
                      children: [
                        Text("Gender",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        DropdownButton <String> (
                          value: genderdropdownValue,
                          borderRadius: BorderRadius.circular(20),
                          
                          style: TextStyle(color: Colors.black),
                          onChanged: (String? value){
                            setState(() {
                              genderdropdownValue = value!;
                            });
                          },

                          items: genderList.map <DropdownMenuItem<String>> ((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          
                        )
                      ],
                    ),

                    Column(
                      children: [
                        Text("University",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                        DropdownButton <String> (
                          borderRadius: BorderRadius.circular(20),
                          value: universitydropdownValue,
                          style: TextStyle(color: Colors.black),
                          onChanged: (String? value){
                            setState(() {
                              universitydropdownValue = value!;
                            });
                          },

                          items: universityList.map <DropdownMenuItem<String>> ((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ],
                ),
                  
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                  InkWell(
                    child: CustomButton(title: "sign up", border: false),
                    onTap: () {
                      if (registerKey.currentState!.validate()) {
                        context.read<RegisterCubit>().postRegister(
                          name: nameCtrl.text,
                          email: emailCtrl.text,
                          password: passwordCtrl.text,
                          phoneNumber: phoneCtrl.text,
                          gender: 'm',
                          context: context  
                        );
                      }
                    }
                  ),


                  SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider(endIndent: 10, indent: 100, color: AppColor.supWidgetColor, thickness: 2)),
                      Text("Or",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.textColor)),
                      Expanded(child: Divider(endIndent: 100,indent: 10,color: AppColor.supWidgetColor,thickness: 2))
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                  InkWell(
                    child: CustomButton(title: "sign in", border: true),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      }
    );
  }
}



