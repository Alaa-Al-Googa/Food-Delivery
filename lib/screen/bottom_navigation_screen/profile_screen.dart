import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gazaburger/screen/personal_data.dart';
import 'package:gazaburger/screen/setting_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'title_dialog'.tr(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'subTitle_dialog'.tr(),
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                  color: Colors.grey,
                                  width: 0.3,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('button_Cancel_dialog'.tr()),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              logout();
                              context.go('/login');
                            },
                            child: Text('button_logOut_dialog'.tr()),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'text_appbar_profile'.tr(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/images/person1.jpg'),
              ),
              Positioned(
                bottom: 0,
                right: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.camera_alt,
                    size: 15,
                    color: Color(0xffFE8C00),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Albert Stevano Bajefski",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text("Albertstevano@gmail.com", style: TextStyle(color: Colors.grey)),
          SizedBox(width: 350, child: Divider(height: 30, thickness: 1)),
          Expanded(
            child: ListView(
              children: [
                sectionTitle('text_profile1'.tr()),
                ListTile(
                  title: Text(
                    'personal_profile'.tr(),
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 230, 230),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.person, color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PersonalData();
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'setting_profile'.tr(),
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 230, 230),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.settings, color: Colors.black),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SettingScreen();
                        },
                      ),
                    );
                  },
                ),
                customTile('card_profile'.tr(), Icons.credit_card),
                SizedBox(height: 20),
                sectionTitle('text_profile2'.tr()),
                customTile('help_profile'.tr(), Icons.info),
                customTile(
                  'account_deletion_profile'.tr(),
                  Icons.delete_outline,
                ),
                customTile('add_account_profile'.tr(), Icons.person_add),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: OutlinedButton.icon(
              onPressed: () {
                showLogoutDialog(context);
              },
              icon: Icon(Icons.logout, color: Colors.red),
              label: Text(
                'logout_profile'.tr(),
                style: TextStyle(color: Colors.red),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customTile(String title, IconData icon) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 231, 230, 230),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title, style: TextStyle(color: Colors.black)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
      onTap: () {},
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}
