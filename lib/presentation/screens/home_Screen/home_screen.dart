import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../bussiness/block/cubit/mqtt_cubit.dart';
import '../../../constants/color_manager/color_manager.dart';
import '../../../constants/style_font_manager/style_manager.dart';
import '../../../constants/text_manager/text_manager.dart';
import '../../../data/repo/mqtt_repo.dart';
import '../home_widget/home_bottom.dart';
import '../home_widget/home_widget.dart';
import '../home_widget/seprated_line.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MqttRepo mqttRepo=MqttRepo();
    return  BlocProvider(
      create: (BuildContext context) =>MqttCubit(mqttRepo),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          leadingWidth: 130.w,
          leading:  Center(child: Text(TextManager.appName,style: TextStyleManager.textStyle20w700.copyWith(fontWeight: FontWeight.bold),)),
          actions: [
            const Icon(Icons.translate,color: ColorManager.colorWhite,size: 30,),
            SizedBox(width: 30.w,),
            const Icon(Icons.settings,color: ColorManager.colorWhite,size: 30,),
            SizedBox(width: 20.w,),
          ],

        ),
        body:  CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SeparatedLine(),),
            const SliverToBoxAdapter(child: HomeWidget(),),
            SliverToBoxAdapter(child: SizedBox(height: 15.h,),),
            const SliverFillRemaining(hasScrollBody: false,child: HomeBottom(),)
          ],
        ),

      ),
    );
  }
}
