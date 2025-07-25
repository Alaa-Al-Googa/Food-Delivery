import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gazaburger/bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool pushNotification = false;
  bool location = true;
  late String selectedLanguage;

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
        initialLanguage: selectedLanguage,
        onSelected: onSelected,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedLanguage = context.locale.languageCode == 'ar'
        ? 'العربية'
        : 'English (US)';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 240, 238, 238),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'text_appbar_setting'.tr(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: sectionTitle('text_setting'.tr()),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SwitchListTile(
              title: Text(
                'notificaton_setting'.tr(),
                style: TextStyle(color: Colors.black),
              ),
              value: pushNotification,
              activeColor: Colors.white,
              activeTrackColor: Color(0xffFE8C00),
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
              title: Text(
                'location_setting'.tr(),
                style: TextStyle(color: Colors.black),
              ),
              value: location,
              activeColor: Colors.white,
              activeTrackColor: Color(0xffFE8C00),
              inactiveThumbColor: Colors.white,
              onChanged: (val) {
                setState(() {
                  location = val;
                });
              },
              contentPadding: EdgeInsets.zero,
            ),
          ),
          ListTile(
            title: Text(
              'title_language_setting'.tr(),
              style: TextStyle(color: Colors.black),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.locale.languageCode == 'ar' ? 'العربية' : 'English',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(width: 20),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            subtitle: Text(
              'subTitle_language_setting'.tr(),
              style: TextStyle(color: Colors.grey),
            ),
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
          SizedBox(height: 10),
          buildArrowTile('about_setting'.tr()),
          buildArrowTile('policy_setting'.tr()),
          buildArrowTile('term_setting'.tr()),
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
      title: Text(title, style: TextStyle(color: Colors.black)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
