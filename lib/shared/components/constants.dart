import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';

String uId = '';

List<Widget> kCustomAppBar = [
  Row(
    children: [
      Hero(
        tag: 'lost',
        child: Image.asset(
          'images/lost.png',
          height: 40.0,
          width: 40.0,
        ),
      ),
      const SizedBox(
        width: 5.0,
      ),
      const Text(
        'Lost',
      ),
    ],
  ),
  const Text(
    'Chats',
  ),
  const Text(
    'Settings',
  )
];

ThemeData kThemeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    toolbarHeight: 65.0,
    color: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black),
    elevation: 0.0,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, color: baseColor, fontSize: 25.0),
    //backgroundColor: Colors.white,
  ),
);
