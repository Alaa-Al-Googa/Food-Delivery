import 'package:flutter/material.dart';
import 'package:gazaburger/screen/personal_data.dart';
import 'package:gazaburger/screen/setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Profile Settings", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          // Profile Picture with edit icon
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
                  padding: EdgeInsets.all(2),
                  child: Icon(Icons.camera_alt, size: 18, color: Colors.orange),
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
          Divider(height: 30, thickness: 1),

          // List Tiles
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Personal Data'),
                  leading: Icon(Icons.person, color: Colors.black),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
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
                  title: Text('Settings'),
                  leading: Icon(Icons.settings, color: Colors.black),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
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
                //customTile("Settings", Icons.settings),
                customTile("Extra Card", Icons.credit_card),
                SizedBox(height: 20),
                sectionTitle("Support"),
                customTile("Help Center", Icons.help),
                customTile("Request Account Deletion", Icons.delete_forever),
                customTile("Add another account", Icons.add),
              ],
            ),
          ),

          // Sign Out Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.logout, color: Colors.red),
              label: Text("Sign Out", style: TextStyle(color: Colors.red)),
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
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
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
