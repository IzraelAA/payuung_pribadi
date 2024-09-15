import 'package:flutter/material.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';

class ExploreWellness extends StatelessWidget {
  const ExploreWellness({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Explore Wellness',
              style: AppTextStyle().dmSansHeading(
                color: AppColor.blackColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Terpopuler',
                style: AppTextStyle().dmSansBody(
                  color: AppColor.blackColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: 8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Logo_Indomaret.png/800px-Logo_Indomaret.png"),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Voucher Digital Indomaret Rp 25.000",
                  style: AppTextStyle().dmSansBody(
                    color: AppColor.blackColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Rp 25.000",
                  style: AppTextStyle().dmSansBody(
                    color: AppColor.blackColor,
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
