import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDeleteDialog {
  static void getDialog(void Function()? onPressed) {
    Get.dialog(
      AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          title: const Text(
            'Delete',
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 0.4,
              fontFamily: 'Roboto',
            ),
          ),
          content: SizedBox(
            height: 100.0,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Text(
                  'Are you sure you want to delete comment?',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 0.4,
                      fontFamily: 'Roboto',),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        Get.back();
                      },
                      minWidth: Get.width / 3.5,
                      height: 38,
                      child: const Text(
                        "CANCEL",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    MaterialButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(9.0)),
                      onPressed: onPressed,
                      minWidth: Get.width / 3.5,
                      height: 38,
                      child: const Text(
                        "DELETE",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
