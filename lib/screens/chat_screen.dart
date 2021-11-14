import 'package:chat_app/widgets/chat/messages.dart';
import 'package:chat_app/widgets/chat/new_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  void initState() {
    super.initState();
    final fbm = FirebaseMessaging.instance;
    fbm.requestPermission();
    FirebaseMessaging.onMessage.listen((msg) {
      print(msg);
      return;
    });

    FirebaseMessaging.onMessageOpenedApp.listen((msg) {
      print(msg);
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INHA studentlari"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Logging out chat'),
                  content: Text('Do you really want to logout?'),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          FirebaseAuth.instance.signOut();
                        },
                        child: Text('YES')
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text('NO')
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
