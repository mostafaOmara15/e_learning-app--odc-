// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/auth/login/login_cubit.dart';
import '../../../constants/constant_methods.dart';
import '../../styles/app_colors.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_textFields.dart';
import '../../widgets/screen_title.dart';
import '../main_screen.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  bool showPass = true;

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          flutterToast(msg: 'Logged in Successfully', color: Colors.green);
          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const MainScreen()),(route) => false);
        }
      },

      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: ScreenTitle(),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Form(
            key: loginKey,
            child: ListView(
              children: [ Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign In",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    AppTextField(
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Email';
                        } else if (!RegExp (
                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]"
                        ).hasMatch(value)) { return 'Please Enter Valid as example@gmail.com';}
                      },  
            
                      fieldCtrl: emailCtrl,
                      lable: "Email",
                      isSecured: false,
                      withIcon: false,
                      isNumField: false
                    ),
            
                    AppTextField(
                      validate: (value) {
                        if (value.isEmpty) {
                          return "Enter your Password";
                        }
                        return null;
                      },
                      fieldCtrl: passwordCtrl,
                      lable: "Password",
                      isSecured: showPass,
                      withIcon: true,
                      isNumField: false,
                      showPass: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                    ),
                    InkWell(
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              color: AppColor.themeColor,
                              fontSize: 18,
                              decoration: TextDecoration.underline)),
                      onTap: () {},
                    ),
                    
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    InkWell(
                        child: CustomButton(title: "sign in", border: false),
                        onTap: () {
                      if (loginKey.currentState!.validate()) {
                        loginCubit.postLogin(
                          email: emailCtrl.text,
                          password: passwordCtrl.text,
                        );
                      }
                    },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            endIndent: 10,
                            indent: 100,
                            color: AppColor.supWidgetColor,
                            thickness: 2,
                          ),
                        ),
                        Text("Or",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.textColor)),
                        Expanded(
                          child: Divider(
                            endIndent: 100,
                            indent: 10,
                            color: AppColor.supWidgetColor,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    InkWell(
                      child: CustomButton(title: "sign up", border: true),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen())),
                    ),
                  ],
                ),
              ),
              ]
            ),
          ),
        );
      },
    );
  }
}
