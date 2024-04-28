import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lamp/presentation/screens/home_widget/seprated_line.dart';

import '../../../constants/color_manager/color_manager.dart';
import '../../../constants/style_font_manager/style_manager.dart';

class HomeBottom extends StatelessWidget {
  const HomeBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SeparatedLine(),
        Container(
          height: 50.h,
          width:double.infinity ,
          color: ColorManager.colorDarkGrey,
          child: Center(child: Text("www.sercodev.com",style: TextStyleManager.textStyle15w700,)),
        )
      ],
    );
  }
}
