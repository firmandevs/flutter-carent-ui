import 'package:flutter/material.dart';

final primaryColor = Color(0xff1C222E);
final accentColor = Color(0xffF36D2F);

final backgroundColor = Colors.indigo.shade50;
final dangerColor = Colors.red[500];
final successColor = Colors.green[600];
final white = Colors.white;
final black = Colors.black;
final grey = Colors.grey;
final lightGrey = Colors.grey[400];
final darkGrey = Colors.grey[600];

final primaryGradientColor = (BuildContext context) => [
      Theme.of(context).primaryColor,
      Theme.of(context).primaryColor,
      Theme.of(context).primaryColorDark,
      Theme.of(context).primaryColorDark,
    ];

final greyGradientColor =
    (BuildContext context) => [Colors.grey.shade100, Colors.grey.shade100];
