import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_manager/color_manager.dart';
class SeparatedLine extends StatelessWidget {
  const SeparatedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      color: ColorManager.colorWhite,
      height: .5.h,
    );
  }
}
