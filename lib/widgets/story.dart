import 'package:flutter/material.dart';
import 'package:linkedIn/constants/colors.dart';
import 'package:linkedIn/models/Posts.dart';
import 'package:provider/provider.dart';

class Story extends StatefulWidget {
  const Story({Key key, this.index}) : super(key: key);

  final index;

  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 450), vsync: this);
    animation = new Tween(
      begin: 0.5,
      end: 1.0,
    ).animate(new CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward(from: 0.5);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(
          top: size.width * 0.03,
          left: size.width * 0.06,
          right: widget.index == 9 ? size.width * 0.06 : 0,
        ),
        child: Column(children: [
          Transform.scale(
            scale: Provider.of<PostModel>(context, listen: false).loading
                ? animation.value < 0.6
                    ? animation.value + 0.5
                    : animation.value
                : 1,
            child: Container(
                width: size.width * 0.15,
                height: size.width * 0.15,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF3c9adc),
                          Color(0xFF3a99d9),
                          Color(0xFF5177d7),
                          Color(0xFF5773d4)
                        ]),
                    shape: BoxShape.circle),
                child: Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        color: kHomePageBackground,
                        shape: BoxShape.circle,
                        image: widget.index == 0 &&
                                !Provider.of<PostModel>(context, listen: false)
                                    .loading
                            ? DecorationImage(
                                image: AssetImage("assets/images/stories.png"),
                              )
                            : null))),
          ),
          SizedBox(height: 10),
          !Provider.of<PostModel>(context, listen: false).loading
              ? Text(
                  "Stories",
                  style: kStoryTag,
                )
              : Text("")
        ]));
  }
}
