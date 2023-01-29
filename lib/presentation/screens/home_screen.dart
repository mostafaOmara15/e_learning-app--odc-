import 'package:flutter/material.dart';
import '../../models/home_card_model.dart';
import '../views/home_screen_cards.dart';
import '../widgets/screen_title.dart';
import 'home_screens/events.dart';
import 'home_screens/finals_screen.dart';
import 'home_screens/lectures_screen.dart';
import 'home_screens/midterm_screen.dart';
import 'home_screens/notes/notes_screen.dart';
import 'home_screens/sections_screen.dart';

class HomeScreen extends StatelessWidget {

  List<HomeScreenCard> cardsList = [
    HomeScreenCard(card: HomeCardModel(title: "Lectures",
     icon: Icons.menu_book_outlined,
    screen: LecturesScreen())),
    HomeScreenCard(card: HomeCardModel(title: "Sections", 
    icon: Icons.people_outline_outlined, 
    screen: SectionsScreen())),
    HomeScreenCard(card: HomeCardModel(title: "Midterms", 
    icon: Icons.event_note_rounded, 
    screen: MidtermsScreen())),
    HomeScreenCard(card: HomeCardModel(title: "Finals", 
    icon: Icons.event_note_outlined, 
    screen: FinalScreen())),
    HomeScreenCard(card: HomeCardModel(title: "Events", 
    icon: Icons.calendar_month_outlined, 
    screen: EventsScreen())),
    HomeScreenCard(card: HomeCardModel(title: "Notes", 
    icon: Icons.task, 
    screen: NotesScreen())),    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScreenTitle(),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GridView.builder(
        itemCount: cardsList.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 2.5,
        ),
              
        itemBuilder: (BuildContext context, int index) {
          return cardsList[index];
        },
      ),
    );
  }
}