import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:linkedIn/components/TabController.dart';
import 'package:linkedIn/screens/profile.dart';
import 'package:linkedIn/models/StatusBar.dart';
import 'package:provider/provider.dart';
import 'models/Posts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StatusBarModel()),
        ChangeNotifierProvider(create: (context) => PostModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'SF-UI',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText2: TextStyle(
                    fontFamily: 'SF-UI',
                    fontSize: 18,
                    fontWeight: FontWeight.w400))),
        routes: {
          "/": (ctx) => TabControllers(),
          Profile.routeName: (ctx) => Profile()
        },
        // home: Home(),
      ),
    );
  }
}
