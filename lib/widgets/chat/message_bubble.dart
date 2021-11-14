import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String username;
  final String image;
  final bool isMe;
  final Key key;

  MessageBubble(this.message, this.username, this.image, this.isMe, {required this.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe? Colors.grey : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                  bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              width: MediaQuery.of(context).size.width * .45,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                      fontSize: 15  ,
                    ),
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            left: isMe ? null : MediaQuery.of(context).size.width * .4,
            right: isMe ? MediaQuery.of(context).size.width * .4 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                image
              ),
            )
        ),
      ]
    );
  }
}
