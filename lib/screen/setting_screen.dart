import 'package:flutter/material.dart';
import 'package:gazaburger/bottom_sheet.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool pushNotification = false;
  bool location = true;
  String selectedLanguage = "English";

  Future<void> showLanguagePickerBottomSheet({
    required BuildContext context,
    required String initialLanguage,
    required void Function(String) onSelected,
  }) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => LanguagePickerBottomSheet(
        initialLanguage: initialLanguage,
        onSelected: onSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text("Settings", style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: sectionTitle("PROFILE"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SwitchListTile(
              title: Text("Push Notification"),
              value: pushNotification,
              activeColor: Colors.white,
              activeTrackColor: Colors.orange,
              inactiveThumbColor: Colors.white,
              onChanged: (val) {
                setState(() {
                  pushNotification = val;
                });
              },
              contentPadding: EdgeInsets.zero,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SwitchListTile(
              title: Text("Location"),
              value: location,
              activeColor: Colors.white,
              activeTrackColor: Colors.orange,
              inactiveThumbColor: Colors.white,
              onChanged: (val) {
                setState(() {
                  location = val;
                });
              },
              contentPadding: EdgeInsets.zero,
            ),
          ),

          // Language Row
          ListTile(
            title: Text("Language"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "English",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(width: 20),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            subtitle: Text('OTHER'),
            onTap: () {
              showLanguagePickerBottomSheet(
                context: context,
                initialLanguage: selectedLanguage,
                onSelected: (language) {
                  setState(() {
                    selectedLanguage = language;
                  });
                },
              );
            },
          ),

          SizedBox(height: 20),
          buildArrowTile("About Ticketis"),
          buildArrowTile("Privacy Policy"),
          buildArrowTile("Terms and Conditions"),
        ],
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget buildArrowTile(String title) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
