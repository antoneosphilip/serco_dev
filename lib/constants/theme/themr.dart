import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_manager/color_manager.dart';
abstract class ThemeApp {
  static ThemeData get light => ThemeData(
    appBarTheme:  AppBarTheme(
        toolbarHeight: 70.h,
        backgroundColor: ColorManager.colorWhite, elevation: 0),
    // fontFamily: GoogleFonts.aBeeZee().fontFamily,

    scaffoldBackgroundColor: ColorManager.colorWhite,
    primaryColor: ColorManager.colorPrimary,
    // fontFamily: GoogleFonts.barlowCondensed().fontFamily,
  );
  static ThemeData get dark => ThemeData(
    // textTheme: TextTheme().copyWith(),
    appBarTheme:  const AppBarTheme(
        backgroundColor: ColorManager.colorDarkGrey, elevation: 0),
    scaffoldBackgroundColor: ColorManager.colorLightDark,
    primaryColor: ColorManager.colorPrimary,

    // fontFamily: GoogleFonts.barlowCondensed().fontFamily,
  );

}
