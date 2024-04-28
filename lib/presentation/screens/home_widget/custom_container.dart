import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../bussiness/block/cubit/mqtt_cubit.dart';
import '../../../bussiness/block/cubit/mqtt_states.dart';
import '../../../constants/color_manager/color_manager.dart';
import '../../../constants/style_font_manager/style_manager.dart';
class CustomContainer extends StatefulWidget {
  final String image;
  final String text;

  const CustomContainer(this.image, this.text, {super.key});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool status = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MqttCubit.get(context).connect(widget.text);

  }
  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<MqttCubit,MqttStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return state is MqttLoadingStates?const Center(child: CircularProgressIndicator(color: Colors.pink,)):
        state is MqttSuccessStates?
        Container(
          decoration: BoxDecoration(
              color: ColorManager.colorBlack,
              borderRadius: BorderRadius.circular(16.r)
          ),
          height: 230.h,
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding:  EdgeInsets.only(top: 30.h),
                    child: FlutterSwitch(
                      activeColor: Colors.pink,
                      width: 80.0.w,
                      height: 40.0.h,
                      valueFontSize: 20.0,
                      toggleSize: 30.0.sp,
                      value: status,
                      borderRadius: 30.0,
                      padding: 8.0,
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                          MqttCubit.get(context).publishMessage(topic: widget.text,message: status==true?"open":"off");
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 16.w,),
                ],
              ),
              SizedBox(height: 70.h,),
              Row(
                children: [
                  SizedBox(width: 16.w,),
                  Text( widget.text,style: TextStyleManager.textStyle20w700,),
                  const Spacer(),
                ],
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  SizedBox(width: 16.w,),
                  Text(status==true?"(open)":"(off)",style: TextStyleManager.textStyle20w700.copyWith(color: Colors.red,),),
                  const Spacer(),
                ],
              ),

            ],

          ),
        ):state is MqttErrorStates?
        Text(state.err):const SizedBox();
      },
    );
  }

}
