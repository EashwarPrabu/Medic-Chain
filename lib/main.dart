import 'package:flutter/material.dart';
import 'loader.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String hex = "00adb5";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMSME',
      theme: ThemeData(
        primaryColor: Color(int.parse("0xff${hex}")),
      ),
      home: Loader(),
      debugShowCheckedModeBanner: false,
    );
  }
}
