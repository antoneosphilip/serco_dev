import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lamp/presentation/screens/home_widget/seprated_line.dart';

import '../../../constants/color_manager/color_manager.dart';
import '../../../constants/style_font_manager/style_manager.dart';
import '../../../constants/text_manager/text_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_container.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h,),
          Row(
            children: [
              Text(TextManager.homeSwitches,style: TextStyleManager.textStyle20w700,),
              const Spacer(),
              const Icon(Icons.refresh,color: ColorManager.colorWhite,size: 30,),
              SizedBox(width: 16.w,),
            ],
          ),
          SizedBox(height: 16.h,),
          Row(
            children: [
               const Expanded(child: CustomContainer('', 'lamp')),
              SizedBox(width: 10.w,),
              const Expanded(child: CustomContainer('',  'lamp2')),
              SizedBox(width: 15.w,),
            ],
          ),
          SizedBox(height: 24.h,),
          const SeparatedLine(),
          SizedBox(height: 24.h,),
          Text(TextManager.homePlugins,style: TextStyleManager.textStyle20w700,),
          SizedBox(height: 30.h,),
          Padding(
            padding:  EdgeInsets.only(right: 200.w),
            child: const CustomContainer('', 'Socket',),
          ),
        ],
      ),
    );
  }
}
