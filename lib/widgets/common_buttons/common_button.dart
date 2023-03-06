// ignore_for_file: deprecated_member_use
import 'package:ask/constants/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final void Function() onPressed;
  final Color fillColor;

  // ignore: use_key_in_widget_constructors
  const CommonButton({
    required this.text,
    required this.textStyle,
    required this.onPressed,
    required this.fillColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: CommonColor.loginAndSendCodeButtonColor,
      width: Get.width/1.9,
      height: 45,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
          side:  BorderSide(
            color:AppColors.buttonColor,
          ),
        ),

        onPressed: onPressed,
        // minWidth: Get.width / 3,
        // height: 42,
        // color: Color.fromRGBO(72, 190, 235, 1),
        color: fillColor?? Colors.transparent,
        child: Text(
          text,
          textScaleFactor: 1.0,
          style: textStyle,
          maxLines: 2,
        ),
      ),
    );
  }
}

class CommonButton2 extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final void Function() onPressed;
  final Color fillColor;

  // ignore: use_key_in_widget_constructors
  const CommonButton2({
    required this.text,
    required this.textStyle,
    required this.onPressed,
    required this.fillColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: CommonColor.loginAndSendCodeButtonColor,
      width: MediaQuery.of(context).size.width/1.4,

      height: 55,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
          side:  BorderSide(
            color: Color(0xff0c473c).withOpacity(0.29),
          ),
        ),

        onPressed: onPressed,
        // minWidth: Get.width / 3,
        // height: 42,
        // color: Color.fromRGBO(72, 190, 235, 1),
        color: fillColor?? Colors.transparent,
        child: Text(
          text,
          textScaleFactor: 1.0,
          style: textStyle,
          maxLines: 2,
        ),
      ),
    );
  }
}



