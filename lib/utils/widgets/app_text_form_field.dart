import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final double borderRadius;
  final bool enabled;
  final double elevation;
  final bool isRequired;

  const AppTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.textStyle,
    this.hintStyle,
    this.isRequired = false,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.borderRadius = 4,
    this.enabled = true,
    this.elevation = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Row(
            children: [
              if (isRequired)
                Text(
                  "*",
                  style: AppTextStyle().dmSansSubtitle(
                    color: Colors.red,
                  ),
                ),
              const SizedBox(
                width: 4,
              ),
              Text(
                labelText!,
                style: AppTextStyle().dmSansBody(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          )
        ],
        Container(
          decoration: BoxDecoration(
              color: enabled ? Colors.white : AppColor.grey,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: AppColor.border,
                width: 1,
              )),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: maxLines,
            validator: validator,
            onChanged: onChanged,
            style: textStyle ?? GoogleFonts.poppins(),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyle().dmSansBody(fontSize: 16),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
              ),
              prefixIcon: prefix,
              suffixIcon: suffix,
              enabled: enabled,
            ),
          ),
        ),
      ],
    );
  }
}
