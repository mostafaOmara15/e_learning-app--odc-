import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/notes/notes_cubit.dart';
import '../../../../data/data_provider/local/sql_helperl.dart';
import '../../../styles/app_colors.dart';
import '../../../widgets/screen_title.dart';
import 'add_notes_screen.dart';
import 'details_of_note_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    NotesCubit notesCubit = NotesCubit.get(context);
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is DatabaseCreate) {
          notesCubit.initialize();
        }
      },
      builder: (context, state) {
        NotesCubit notesCubit = NotesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: ScreenTitle(title: "Notes"),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: BackButton(color: AppColor.themeColor),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: FutureBuilder(
              future: SqlHelper.getAllRowsDB(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Center(
                      child: Text("There's No Notes To Show",style: TextStyle( fontSize: 26,  color: Colors.black)));
                  }
                  //if there's  data in the list of notes
                  else {
                    return ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },

                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                          //list of notes
                          child: ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return DetailsOfNoteScreen(
                                      title: snapshot.data[index].title,
                                      date: snapshot.data[index].date,
                                      description: snapshot.data[index].description,
                                    );
                                  }
                                )
                              );
                            },
                            //title of note
                            title: Text("${snapshot.data[index].title}",style: TextStyle(fontSize: 20, color: AppColor.textColor)),
                            //date of note
                            subtitle: Text("${snapshot.data[index].date}",style: TextStyle(fontSize: 20, color: AppColor.textColor)),
                            //btn edit + btn delete
                            trailing: Wrap(
                              children: [
                                //btn edit
                                IconButton(
                                  onPressed: () {
                                    notesCubit.getOneNote(
                                      context,
                                      snapshot.data[index].id,
                                      snapshot.data[index].title,
                                      snapshot.data[index].description,
                                      snapshot.data[index].date
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                  iconSize: 15,
                                  color: AppColor.themeColor,
                                ),
                                //btn delete
                                IconButton(
                                  onPressed: () {
                                    notesCubit.delete(snapshot.data[index].id);
                                  },
                                  icon: const Icon(Icons.delete),
                                  iconSize: 15,
                                  color: AppColor.themeColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),

          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.themeColor,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => AddNotesScreen()));
            },
            child: const Icon(Icons.add,color: Colors.white,),
          ),
        );
      },
    );
  }
}
