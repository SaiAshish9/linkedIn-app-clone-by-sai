import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkedIn/components/model.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/constants/styles.dart';
import 'package:linkedIn/models/StatusBar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class Post extends StatefulWidget {
  const Post({Key key, this.data}) : super(key: key);

  final data;
  @override
  _PostState createState() => _PostState();
}

changeNavigationColor(Color color, bool dark) async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    if (dark) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
    // setNavigationBarColor
  } on PlatformException catch (e) {
    debugPrint(e.toString());
  }
}

class _PostState extends State<Post> {
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
                        Text(widget.data["userReaction"],
                            style: kPostHiglightedTag),
                        SizedBox(width: 4),
                        Text(
                          widget.data["userReactionText"],
                          style: kPostLightTag,
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          changeNavigationColor(Color(0xFF757575), true);
                          Provider.of<StatusBarModel>(context, listen: false)
                              .alterTheme(Colors.black, false);
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => Modal()).whenComplete(() {
                            changeNavigationColor(Colors.white, false);
                            Provider.of<StatusBarModel>(context, listen: false)
                                .alterTheme(Colors.white, true);
                          });
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
                      height: size.height * 0.06,
                      width: size.height * 0.06,
                      decoration: BoxDecoration(
                        color: kHomePageBackground,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(widget.data["author"]["image"]),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: size.height * 0.08,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data["author"]["name"],
                            style: kPostHiglightedTag,
                          ),
                          Text(
                            widget.data["author"]["headline"],
                            style: kPostSmallText,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.data["published"],
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
                      widget.data["image"],
                    ),
                    fit: BoxFit.fill),
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
                          widget.data["reactions"],
                          style: kPostSmallText,
                        ),
                        Text(
                          "${widget.data['commentCount']} comments",
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
