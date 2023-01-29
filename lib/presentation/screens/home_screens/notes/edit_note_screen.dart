import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../business_logic/notes/notes_cubit.dart';
import '../../../styles/app_colors.dart';
import '../../../widgets/screen_title.dart';


//This Screen use for edit a note
class EditNotesScreen extends StatelessWidget {

  String title;
  int id;
  String description;

  TextEditingController editTitle = TextEditingController();
  TextEditingController editDescription = TextEditingController();

  EditNotesScreen({
    required this.description,
    required this.id,
    required this.title,
  });



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(

      builder: (context, state) {
        NotesCubit notesCubit = NotesCubit.get(context);
        return Scaffold(
            appBar: AppBar(
            title: ScreenTitle(title: "Edit"),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: BackButton(color: AppColor.themeColor),
          ),

          body: Form(
            key: notesCubit.editNoteKey,
            child: Column(
              children: [
                //Title
                SizedBox(height:MediaQuery.of(context).size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: TextFormField(
                      controller: editTitle,
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
                        editTitle.text = value;
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
                  ),

                  //Description
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: TextFormField(
                      controller: editDescription,
                      maxLines: 5,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Enter Your Description';
                        }
                      },
                      onChanged: (value) {
                        editDescription.text = value;
                        print("description: $value");
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
                  ),

                  //Button Edit
                  Container(
                    width: 120,
                    margin: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(
                      child: Text("Add", style: TextStyle(color: Colors.white, fontSize: 18),),
                      onPressed: () {
                        if (notesCubit.editNoteKey.currentState!.validate()) {
                          notesCubit.update(
                          context,
                          id,
                          editTitle.text == "" ? title : editTitle.text,
                          editDescription.text == "" ? description : editDescription.text,
                          DateFormat("hh:mm a      dd/MM/yyyy").format(DateTime.now()),
                          );
                        }
                      }
                    ),
                  ),
                ],
              ),
            )
          );
      },
    );
  }
}
