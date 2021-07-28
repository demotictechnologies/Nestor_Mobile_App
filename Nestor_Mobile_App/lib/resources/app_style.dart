import 'package:flutter/material.dart';

class AppStyles {
  static const Color PRIMARY_TEXTCOLOR = Colors.black;
  static const Color SECONDARY_TEXTCOLOR = Colors.grey;
  static const double SMALL_TEXTSIZE = 13.0;
  static const double MEDIUM_TEXTSIZE = 15.0;
  static const double LARGE_TEXTSIZE = 16.0;
  static const double EXTRA_LARGE_TEXTSIZE = 30.0;

  static const TitleTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: AppStyles.LARGE_TEXTSIZE,
    color: Colors.black,
  );

  static const MediumTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: AppStyles.MEDIUM_TEXTSIZE,
    color: Colors.black,
  );

  static const SubTitleTextStyle = TextStyle(
    fontSize: AppStyles.SMALL_TEXTSIZE,
    color: AppStyles.SECONDARY_TEXTCOLOR,
  );

  static const SubTitleMediumTextStyle = TextStyle(
    fontSize: AppStyles.MEDIUM_TEXTSIZE,
    color: AppStyles.SECONDARY_TEXTCOLOR,
  );

  static const LargeTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: AppStyles.EXTRA_LARGE_TEXTSIZE,
    color: Colors.black,
  );

  static const SmallTextStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: Colors.black,
  );

  static const LargeSubtitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: AppStyles.MEDIUM_TEXTSIZE,
    color: AppStyles.SECONDARY_TEXTCOLOR,
  );
}
