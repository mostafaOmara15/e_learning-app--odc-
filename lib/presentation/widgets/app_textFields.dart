import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/app_colors.dart';


class AppTextField extends StatefulWidget {
  
  final TextEditingController fieldCtrl;
  final Function? validate;
  final String lable;
  final bool withIcon;
  final bool isSecured;
  Function()? showPass;
  final bool isNumField;

  AppTextField({
    this.validate,
    required this.fieldCtrl,
    required this.lable,
    required this.withIcon,
    required this.isSecured,
    required this.isNumField,
    this.showPass,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField (
          controller: widget.fieldCtrl,
          validator: (p) => widget.validate!(p),
          obscureText: widget.isSecured,

          style: widget.isNumField 
            ? TextStyle(color: AppColor.textColor) 
            : null,

          inputFormatters: widget.isNumField 
            ? <TextInputFormatter> [
                FilteringTextInputFormatter.digitsOnly
              ]
            : null,
          decoration: InputDecoration(

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.themeColor,),
            borderRadius: BorderRadius.circular(20)
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.supWidgetColor),
            borderRadius: BorderRadius.circular(20)
          ),
                    
          labelText: widget.lable,
          labelStyle: TextStyle(color: AppColor.supWidgetColor, fontSize: 18, fontWeight: FontWeight.bold),
          floatingLabelStyle: TextStyle(color: AppColor.themeColor,fontSize: 18, fontWeight: FontWeight.bold),
        
          suffixIcon: widget.withIcon
            ? IconButton(
              onPressed: widget.showPass,
              icon: widget.isSecured
              ? Icon(Icons.visibility_off,color: AppColor.themeColor)
              : Icon(Icons.visibility, color: AppColor.themeColor)
            )
            :null,
          )
        ),

        SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
      ],
    );
  }
}