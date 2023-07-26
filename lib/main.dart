import 'package:flutter/material.dart';
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/resources/app_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kBlack200),
        title: 'Music App',
        home: HomePage());
  }
}
