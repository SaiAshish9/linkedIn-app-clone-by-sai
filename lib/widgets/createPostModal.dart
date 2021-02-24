import 'package:flutter/material.dart';
import 'package:linkedIn/constants/styles.dart';
import 'package:linkedIn/models/PostOptions.dart';

class CreatePostModal extends StatefulWidget {
  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<CreatePostModal> {
  List items = [
    PostOptions(
      icon: Icon(Icons.insert_photo, color: Color(0xFF8d8d8d)),
      title: "Add a photo",
    ),
    PostOptions(
        icon: Icon(Icons.videocam, color: Color(0xFF8d8d8d)),
        title: "Take a vieo"),
    PostOptions(
      icon: Icon(Icons.celebration, color: Color(0xFF8d8d8d)),
      title: "Celebrate an occasion",
    ),
    PostOptions(
      icon: Icon(Icons.description, color: Color(0xFF8d8d8d)),
      title: "Add a document",
    ),
    PostOptions(
      icon: Icon(Icons.work, color: Color(0xFF8d8d8d)),
      title: "Share that you're hiring",
    ),
    PostOptions(
      icon: Icon(Icons.how_to_reg, color: Color(0xFF8d8d8d)),
      title: "Find an expert",
    ),
    PostOptions(
      icon: Icon(Icons.poll, color: Color(0xFF8d8d8d)),
      title: "Create a poll",
    ),
    PostOptions(
      icon: Icon(Icons.perm_media, color: Color(0xFF8d8d8d)),
      title: "Share a story",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: Color(0xff757575), borderRadius: BorderRadius.circular(0)),
      child: Container(
        height: size.height * 0.68,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
                height: 3.5,
                decoration: BoxDecoration(
                    color: Color(0xFF8d8d8d),
                    borderRadius: BorderRadius.circular(3)),
                width: 50),
            SizedBox(
              height: 15,
            ),
            Container(
              height: size.height * 0.62,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final option = items[index];
                  return ListTile(
                    onLongPress: () {},
                    title: Text(
                      option.title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF8d8d8d)),
                    ),
                    leading: option.icon,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
