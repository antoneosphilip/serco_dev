import 'package:flutter/material.dart';

import '../color_manager/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


abstract class TextStyleManager {
  static final TextStyle textStyle36w700 = TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.w700,
      color: ColorManager.colorWhite);
  static final TextStyle textStyle20w700 = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: ColorManager.colorWhite);
  static final TextStyle textStyle15w700 = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
      color: ColorManager.colorWhite);
}
