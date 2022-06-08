import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/pages/splash/splash_page.dart';
import 'presentation/styles/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        backgroundColor: Colors.black,
      ),
      home: SplashPage(),
    );
  }
}
