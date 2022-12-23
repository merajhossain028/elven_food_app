import 'package:flutter/material.dart' show Colors, ThemeData, VisualDensity;

ThemeData get lightTheme => ThemeData(
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
