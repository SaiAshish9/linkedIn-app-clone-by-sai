import 'package:flutter/material.dart';
import 'package:linkedIn/components/draft.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
          barrierColor: Colors.white,
          enableDrag: false,
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Draft();
          }).whenComplete(() {
        Navigator.of(context).pushReplacementNamed('/');
        // Navigator.of(context).pushReplacement(
        //   CustomRoute(
        //     builder: (ctx) => OrdersScreen(),
        //   ),
        // );
        // Navigator.push(context,
        //   MaterialPageRoute(builder: (context) {
        //      return CityScreen();
        //   }));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
      ),
    );
  }
}
