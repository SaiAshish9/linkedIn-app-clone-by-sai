import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/constants/styles.dart';
import 'package:linkedIn/models/PostOptions.dart';

class Post extends StatelessWidget {
  const Post({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.01),
      color: Colors.white,
      width: size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.width * 0.03),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("Sarthak", style: kPostHiglightedTag),
                        SizedBox(width: 4),
                        Text(
                          "celebrates this",
                          style: kPostLightTag,
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => Modal());
                        },
                        child: Icon(Icons.keyboard_arrow_down))
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  color: Color(0xFFe0e0e0),
                ),
                Row(
                  children: [
                    Container(
                      height: size.height * 0.08,
                      width: size.height * 0.08,
                      decoration: BoxDecoration(
                        color: kHomePageBackground,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://media-exp1.licdn.com/dms/image/C4D0BAQHiNSL4Or29cg/company-logo_200_200/0/1519856215226?e=1622073600&v=beta&t=p9zXj2dj6BXsOGH65sw6Sw4iWqAg_h4q38ABubR4a2A"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: size.height * 0.08,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Google",
                            style: kPostHiglightedTag,
                          ),
                          Text(
                            "20,701,240 followers",
                            style: kPostSmallText,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "1w",
                                style: kPostSmallText,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.circle,
                                size: 3.2,
                                color: Color(0xFF7a7a7a),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.public,
                                size: 12,
                                color: Color(0xFF7a7a7a),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                color: kHomePageBackground,
                image: DecorationImage(
                    image: NetworkImage(
                      "https://media-exp1.licdn.com/dms/image/C5622AQEcCkjOSS3xJg/feedshare-image-offsite-ads_350_624/0/1613995014067?e=1617235200&v=beta&t=ukgWOspqqx8TBnU99KhVnUL2f-EdbOkg_sVtRatoLyM",
                    ),
                    fit: BoxFit.cover),
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.width * 0.03, horizontal: size.width * 0.03),
            child: Row(
              children: [
                CommentIcon(url: "assets/icons/like-filled.svg"),
                CommentIcon(url: "assets/icons/heart-filled.svg"),
                CommentIcon(url: "assets/icons/claps-filled.svg"),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "1,616",
                          style: kPostSmallText,
                        ),
                        Text(
                          "28 comments",
                          style: kPostSmallText,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Column(
              children: [
                Divider(
                  height: 0,
                  thickness: 0.5,
                  color: Color(0xFFe0e0e0),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: size.height * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Reaction(text: "Like", icon: "like"),
                        Reaction(text: "Comment", icon: "comment"),
                        Reaction(text: "Share", icon: "share"),
                        Reaction(text: "Send", icon: "send")
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Modal extends StatelessWidget {
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
          boxShadow: null,
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

class Reaction extends StatelessWidget {
  const Reaction({Key key, @required this.text, @required this.icon})
      : super(key: key);
  final text;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          "assets/icons/$icon-outlined.svg",
          height: 14,
        ),
        Text(text, style: kReactionText)
      ],
    );
  }
}

class CommentIcon extends StatelessWidget {
  const CommentIcon({Key key, @required this.url}) : super(key: key);

  final url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 3),
      child: SvgPicture.asset(
        url,
        height: 16,
      ),
    );
  }
}
