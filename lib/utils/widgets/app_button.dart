import 'package:flutter/material.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';

class AppButton {
  Widget primary({
    required Function()
        onPressed, // Function to be executed when the button is pressed
    required String text, // Text displayed on the button
    bool loading = false, // Flag to determine if the button is loading
    bool enabled =
        true, // Flag to determine if the button is enabled or disabled
    Color? color, // Background color of the button (default: system color)
    Color?
        borderColor, // Background color of the button (default: system color)
    Color? textColor, // Text color of the button (default: black)
    double textSize = 14, // Font size of the button text (default: 14)
    BorderRadius? radius, // Border radius of the button
    Widget? leftWidget, // Widget to be displayed on the left of the button text
    Widget?
        rightWidget, // Widget to be displayed on the right of the button text
    double?
        width, // Flag to determine if the button should match the parent width
  }) {
    return InkWell(
      onTap: loading // if loading is true, onPressed is null
          ? null
          : enabled
              ? () {
                  onPressed();
                }
              : null, // Disable the button if not enabled
      child: Container(
        width: width ?? double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 9.5),
        decoration: BoxDecoration(
            borderRadius: radius ?? BorderRadius.all(Radius.circular(4)),
            color: color ?? AppColor.primaryColor,
            border: Border.all(
              color: borderColor ?? AppColor.primaryColor,
              width: 1,
            )),
        child: loading
            ? SizedBox(
                height: textSize * 1.5,
                width: textSize * 1.5,
                child: CircularProgressIndicator(
                  color: textColor ?? AppColor.blackColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leftWidget != null) ...[
                    leftWidget,
                    const SizedBox(width: 6),
                  ],
                  Text(
                    text,
                    style: AppTextStyle().dmSansTitle(
                      color: textColor ?? Colors.white,
                    ),
                  ),
                  if (rightWidget != null) ...[
                    const SizedBox(
                      width: 6,
                    ),
                    rightWidget
                  ],
                ],
              ),
      ),
    );
  }
}
