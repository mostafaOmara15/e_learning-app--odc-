import 'package:flutter/material.dart';
import '../screens/Settings_screens/faq_screen.dart';
import '../screens/Settings_screens/partners.dart';
import '../screens/Settings_screens/support.dart';
import '../screens/Settings_screens/term_conditions.dart';
import '../styles/app_colors.dart';
import '../widgets/screen_title.dart';
import '../views/settings_listTile.dart';
import 'register/signin_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScreenTitle(title: "Settings"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SettingListTile(title: "FAQ", screen: FAQScreen()),
            SettingListTile(title: "Terms & Conditins", screen: TermsConditionsScreen()),
            SettingListTile(title: "Our Partners", screen: PartnerScreen()),
            SettingListTile(title: "Support", screen: SupportScreen()),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text("Log Out", style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.textColor)),
                  trailing: Icon(Icons.navigate_next, color: Colors.black, size: 35),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                      title: const Text('Log Out'),
                      content: const Text('Are You sure?',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel',style: TextStyle( fontWeight: FontWeight.bold)),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const SignInScreen()),(route) => false),
                            child: const Text('OK',style: TextStyle( fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}