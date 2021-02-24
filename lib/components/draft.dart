import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/widgets/Circle.dart';
import 'package:linkedIn/widgets/createPostModal.dart';

class Draft extends StatefulWidget {
  @override
  _DraftState createState() => _DraftState();
}

class _DraftState extends State<Draft> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      show();
    });
    super.initState();
  }

  void show() {
    changeNavigationColor(Color(0xFF757575), true);
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => CreatePostModal()).whenComplete(() {
      changeNavigationColor(Colors.white, false);
    });
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Color(0xFFe6e6e6),
      width: size.width,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: size.height * 0.12,
            width: size.width,
            child: Container(
              height: size.height * 0.12,
              width: size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    height: size.height * 0.09,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.clear,
                                    size: 27, color: Color(0xFF949494))),
                            SizedBox(width: 10),
                            Text(
                              "Share post",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Text("Next",
                            style: TextStyle(
                                color: Color(0xFFcfcfcf),
                                fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 3),
          Flexible(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Circle(
                              url: kProfilePicURL,
                              width: size.width * 0.14,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Sai Ashish",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "What do you want to talk about?",
                          style: TextStyle(color: Color(0xFFafafaf)),
                        )
                      ],
                    ),
                  )),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "# Add hashtag",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1b62a9)),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.photo_camera,
                                    color: Color(0xFF666666)),
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(Icons.videocam, color: Color(0xFF666666)),
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(Icons.insert_photo,
                                    color: Color(0xFF666666)),
                                SizedBox(
                                  width: 12,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      show();
                                    },
                                    child: Icon(Icons.more_horiz,
                                        color: Color(0xFF666666))),
                              ],
                            ),
                            Icon(Icons.alternate_email,
                                color: Color(0xFF666666)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
