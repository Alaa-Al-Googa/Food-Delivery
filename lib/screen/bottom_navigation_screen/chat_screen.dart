import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {
      "name": "Geopart Etdsien",
      "message": "Your Order Just Arrived!",
      "time": "13.47",
      "image": "assets/images/person1.jpg",
      "status": "read",
    },
    {
      "name": "Stevano Clirover",
      "message": "Your Order Just Arrived!",
      "time": "11.23",
      "image": "assets/images/person2.png",
      "status": "unread",
    },
    {
      "name": "Elisia Justin",
      "message": "Your Order Just Arrived!",
      "time": "11.23",
      "image": "assets/images/person3.png",
      "status": "read",
    },
    {
      "name": "Geopart Etdsien",
      "message": "Your Order Just Arrived!",
      "time": "13.47",
      "image": "assets/images/person1.jpg",
      "status": "read",
    },
    {
      "name": "Stevano Clirover",
      "message": "Your Order Just Arrived!",
      "time": "11.23",
      "image": "assets/images/person2.png",
      "status": "unread",
    },
    {
      "name": "Elisia Justin",
      "message": "Your Order Just Arrived!",
      "time": "11.23",
      "image": "assets/images/person3.png",
      "status": "read",
    },
    {
      "name": "Elisia Justin",
      "message": "Your Order Just Arrived!",
      "time": "11.23",
      "image": "assets/images/person1.jpg",
      "status": "read",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Chat List",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "All Message",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                var chat = chats[index];
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(chat['image']),
                      radius: 25,
                    ),
                    title: Text(
                      chat['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(chat['message']),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          chat['time'],
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        if (chat['status'] == "read")
                          Icon(Icons.check, color: Color(0XffFE8C00), size: 18)
                        else if (chat['status'] == "unread")
                          Icon(
                            FontAwesomeIcons.checkDouble,
                            color: Color(0XffFE8C00),
                            size: 12,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
