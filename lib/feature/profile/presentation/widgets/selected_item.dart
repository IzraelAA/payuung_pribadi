import 'package:flutter/material.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';

class ProfileInfoCard extends StatelessWidget {
  final String title;
  final Icon icon;

  const ProfileInfoCard({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: icon,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: AppTextStyle().dmSansBody(
              color: AppColor.blackColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
