import 'package:flutter/material.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';

class HeaderDashboard extends StatefulWidget {
  const HeaderDashboard({super.key});

  @override
  State<HeaderDashboard> createState() => _HeaderDashboardState();
}

class _HeaderDashboardState extends State<HeaderDashboard> {
  bool isPribadi = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32), color: AppColor.grey),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                isPribadi = true;
                setState(() {

                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: isPribadi ? AppColor.primaryColor : AppColor.grey),
                child: Text(
                  "Payuung Pribadi",
                  textAlign: TextAlign.center,
                  style: AppTextStyle().dmSansBody(
                    color: !isPribadi ? AppColor.greyText : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                isPribadi = false;
                setState(() {

                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: !isPribadi ? AppColor.primaryColor : AppColor.grey),
                child: Text(
                  "Payuung Karyawan",
                  textAlign: TextAlign.center,
                  style: AppTextStyle().dmSansBody(
                    color: isPribadi ? AppColor.greyText : Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
