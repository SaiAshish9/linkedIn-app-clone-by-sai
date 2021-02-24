import 'package:flutter/material.dart';
import 'package:linkedIn/constants/styles.dart';
import 'package:linkedIn/models/PostOptions.dart';

class Modal extends StatefulWidget {
  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  List items = [
    PostOptions(
        icon: Icon(Icons.bookmark_border_outlined, color: Color(0xFF404040)),
        title: "Save",
        description: "Save this item for later"),
    PostOptions(
        icon: Icon(Icons.share_outlined, color: Color(0xFF404040)),
        title: "Share via"),
    PostOptions(
        icon: Icon(Icons.cancel, color: Color(0xFF404040)),
        title: "Unfollow",
        description: "Stay connected but stop seeing such post's"),
    PostOptions(
        icon: Icon(Icons.volume_off, color: Color(0xFF404040)),
        title: "Mute",
        description: "Stop seeing such post's"),
    PostOptions(
        icon: Icon(Icons.visibility_off, color: Color(0xFF404040)),
        title: "I don't want to see this",
        description: "Let us know why don't want to see this post"),
    PostOptions(
        icon: Icon(Icons.flag, color: Color(0xFF404040)),
        title: "Report this post",
        description: "This post is offensive or the account is hacked"),
    PostOptions(
        icon: Icon(Icons.remove_red_eye, color: Color(0xFF404040)),
        title: "Who can see this post?",
        description: "Visible to anyone on or off LinkedIn"),
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
        height: size.height * 0.657,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final option = items[index];
            return option.description != null
                ? ListTile(
                    onLongPress: () {},
                    title: Text(
                      option.title,
                      style: kReactionTitle,
                    ),
                    subtitle: Text(
                      option.description,
                      style: kReactionSubTitle,
                    ),
                    leading: option.icon,
                  )
                : ListTile(
                    onLongPress: () {},
                    title: Text(
                      option.title,
                      style: kReactionTitle,
                    ),
                    leading: option.icon,
                  );
          },
        ),
      ),
    );
  }
}
