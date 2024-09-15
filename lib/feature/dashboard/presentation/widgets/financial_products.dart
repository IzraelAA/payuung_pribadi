import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';

class FinancialProducts extends StatelessWidget {
  FinancialProducts({super.key});

  List category = [
    'Urun',
    'Pembiayaan\nPorsi Haji',
    'Financial\nCheck Up',
    'Asuransi\nMobil',
    'Asuransi\nProperti',
  ];

  List<SvgPicture> categoryIcon = [
    SvgPicture.asset(
      'assets/svg/urun.svg',
      width: 30,
      height: 30,
      color: const Color(0xffa18e3d),
    ),
    SvgPicture.asset(
      'assets/svg/pembiayaan_haji.svg',
      width: 30,
      height: 30,
      color: const Color(0xff68c756),
    ),
    SvgPicture.asset(
      'assets/svg/financial_check_up.svg',
      width: 30,
      height: 30,
      color: const Color(0xffe9c030),
    ),
    SvgPicture.asset(
      'assets/svg/asuransi_mobil.svg',
      width: 30,
      height: 30,
      color: const Color(0xff577696),
    ),
    SvgPicture.asset(
      'assets/svg/asuransi_properti.svg',
      width: 30,
      height: 30,
      color: const Color(0xffd65355),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Produk Keuangan',
          style: AppTextStyle().dmSansHeading(
            color: AppColor.blackColor,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: category.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: categoryIcon[index],
                  ),
                ),
                Text(
                  category[index],
                  style: AppTextStyle().dmSansBody(
                    color: AppColor.blackColor,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            );
          },
        )
      ],
    );
  }
}
