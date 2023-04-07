import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors/app_colors.dart';
import '../common_textfields/commn_textfield.dart';
import '../common_textstyle/common_text_style.dart';

class CommonDropDownField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String? hinttext;
  final List values;
  final checkedvalue;
  final String listMapName;
  final String listMapId;
  final screenController;
  final flex;
  final readOnly;
  final doCallback;
  final Color fillColor;
  final double radius;
  final double? width;
  final Color? iconcolor;
  final Color? textcolor;
  final Color? dropdownColor;

  CommonDropDownField({
    required this.controller,
    required this.placeholder,
    required this.values,
    this.hinttext,
    this.checkedvalue,
    this.listMapName = 'name',
    this.listMapId = 'id',
    @required this.screenController,
    this.flex = 1,
    this.readOnly = false,
    this.doCallback,
    this.fillColor = Colors.white,
    this.radius = 10.0,
    this.width,
    this.iconcolor,
    this.textcolor,
    this.dropdownColor,
  });

  @override
  Widget build(context) {
    TextEditingController terminalName = TextEditingController();
    if (readOnly) {
      for (var list in values) {
        if (checkedvalue.text == list[listMapId]) {
          terminalName.text = list[listMapName];
        }
      }
    }

    return readOnly == false
        ? SizedBox(
            width: width ?? Get.width,
            // height: 60,
            child: InputDecorator(
              baseStyle: const TextStyle(fontSize: 10),
              decoration: InputDecoration(
                fillColor: fillColor,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 11.0, horizontal: 18.0),
                focusColor: Colors.black,
                hoverColor: Colors.black,
                hintStyle: const TextStyle(
                    color: Color(0xff1E1E1E),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: fillColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: fillColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
                labelStyle:
                    const TextStyle(color: Color(0xffB2B2B2), fontSize: 10.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  dropdownColor: dropdownColor ?? Colors.white,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 20.0,
                    color: iconcolor,
                  ),
                  style: const TextStyle(
                      color: AppColors.welcomeToTextColor,
                      letterSpacing: 0.4,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400),
                  value: checkedvalue.text != ''
                      ? checkedvalue.text
                      : values[0][listMapId].toString(),
                  isDense: true,
                  isExpanded: true,
                  selectedItemBuilder: (context) {
                    return values.map((e) {
                      return Text(
                        '${e[listMapName]}',
                        style: TextStyle(
                          color: textcolor ?? const Color(0xff1E1E1E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.0,
                        ),
                      );
                    }).toList();
                  },
                  items: values.map((list) {
                    return DropdownMenuItem(
                      value: list[listMapId].toString(),
                      child: list[listMapName] != ''
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${list[listMapName]}',
                                  style: TextStyle(
                                    color: textcolor ?? const Color(0xff1E1E1E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                                ),
                                const Divider(
                                  color: Color(0xffD9D9D9),
                                ),
                              ],
                            )
                          : const Text(
                              'notfound',
                              style: TextStyle(
                                color: Color(0xff1E1E1E),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto',
                                letterSpacing: 0.0,
                              ),
                            ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.text = value.toString();
                    if (screenController != null) {
                      screenController.update();
                    }
                    doCallback != null ? doCallback() : print('no callback');
                  },
                ),
              ),
            ),
          )
        : CommonTextField(
            controller: terminalName,
            readOnly: false,
            labelText: placeholder,
          );
  }
}
