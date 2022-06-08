import 'package:carent/presentation/styles/colors.dart';
import 'package:carent/presentation/styles/label.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatefulWidget {
  SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: primaryColor,
          ),
          Center(
            child: Text(
              "Carent",
              style: labelH1White,
            ),
          ),
        ],
      ),
    );
  }
}
