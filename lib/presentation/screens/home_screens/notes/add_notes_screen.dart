import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/notes/notes_cubit.dart';
import '../../../styles/app_colors.dart';
import '../../../widgets/screen_title.dart';

class AddNotesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<NotesCubit, NotesState>(

      builder: (context, state) {
        NotesCubit notesCubit = NotesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: ScreenTitle(title: "Add Note"),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: BackButton(color: AppColor.themeColor),
          ),

          body: Form(
            key: notesCubit.addNoteKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    SizedBox(height:MediaQuery.of(context).size.height *0.05),

                    TextFormField(
                      controller: notesCubit.titleController,
                      maxLines:1,
                      validator: (val) {
                        if (val!.isEmpty) {
                            return 'Please Enter Your Title';
                        }
                        else if(val.length > 50) {
                          return "Title must be less than 50 characters";
                        }
                      },
                      onChanged: (value) {
                        notesCubit.title = value;
                      },

                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.themeColor,),
                          borderRadius: BorderRadius.circular(20)
                        ),
                
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.supWidgetColor),
                          borderRadius: BorderRadius.circular(20)
                        ),
                          
                        labelText: "Title",
                        labelStyle: TextStyle(color: AppColor.supWidgetColor, fontSize: 18, fontWeight: FontWeight.bold),
                        floatingLabelStyle: TextStyle(color: AppColor.themeColor,fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ),

                    SizedBox(height:MediaQuery.of(context).size.height *0.05),

                    TextFormField(
                      controller: notesCubit.descriptionController,
                      maxLines: 5,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Enter Your Description';
                        }
                      },
                      onChanged: (value) {
                        notesCubit.description = value;
                      },

                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.themeColor,),
                          borderRadius: BorderRadius.circular(20)
                        ),
                
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.supWidgetColor),
                          borderRadius: BorderRadius.circular(20)
                        ),
                          
                        labelText: "Description",
                        labelStyle: TextStyle(color: AppColor.supWidgetColor, fontSize: 18, fontWeight: FontWeight.bold),
                        floatingLabelStyle: TextStyle(color: AppColor.themeColor,fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ),
                    
                    SizedBox(height:MediaQuery.of(context).size.height *0.05),

                    ElevatedButton(
                      onPressed: () {
                        if (notesCubit.addNoteKey.currentState!.validate()){
                          notesCubit.insert(context);
                        }
                      }, 

                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Add", style: TextStyle(color: Colors.white, fontSize: 18),),
                      ),

                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder> (
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColor.themeColor)
                          )
                        )
                      )  
                    )
                  ],
                ),
              ),
            )
          );
        },
      );
  }
}
