// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomHeadingText extends StatelessWidget {
  String title;
  double fontSize;
  CustomHeadingText({
    Key? key,
    required this.title,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        textStyle: Theme.of(context).textTheme.headlineMedium,
        fontSize: fontSize,
        color: Colors.white,
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomSubText extends StatelessWidget {
  String subtitle;
  CustomSubText({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: GoogleFonts.poppins(
        textStyle: Theme.of(context).textTheme.labelMedium,
        fontSize: 12,
        color: Colors.white,
      ),
    );
  }
}
