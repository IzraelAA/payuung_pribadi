
import 'package:flutter/material.dart';
import 'package:payuung_pribadi/feature/dashboard/presentation/widgets/semi_circle_border_painter.dart';
import 'package:payuung_pribadi/feature/dashboard/presentation/widgets/semi_circle_clipper.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';

class NavBarPanel extends StatelessWidget {
  final ScrollController controller;
  final bool isExpanse;

  const NavBarPanel({
    super.key,
    required this.controller,
    required this.isExpanse,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: SemiCircleBorderPainter(),
          child: ClipPath(
            clipper: SemiCircleClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: AppColor.border,
                    width: 2,
                  ),
                ),
              ),
              child: ListView(
                controller: controller, // Attach the ScrollController here
                padding: const EdgeInsets.all(12),
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _iconButton(
                              "Beranda",
                              Icons.home_outlined,
                              true,
                            ),
                            _iconButton(
                              "Cari",
                              Icons.search,
                              false,
                            ),
                            _iconButton(
                              "Keranjang",
                              Icons.shopping_cart_outlined,
                              false,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _iconButton(
                              "Daftar Transaksi",
                              Icons.article,
                              false,
                            ),
                            _iconButton(
                              "Voucher Saya",
                              Icons.payments,
                              false,
                            ),
                            _iconButton(
                              "Alamat Pengiriman",
                              Icons.location_on_outlined,
                              false,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _iconButton(
                              "Daftar Teman",
                              Icons.people_outline,
                              false,
                            ),
                            const SizedBox(width: 120,),
                            const SizedBox(width: 120,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Icon(
              !isExpanse ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppColor.cardHeader2,
              size: 42,
            ),
          ),
        ),
      ],
    );
  }

  Widget _iconButton(String text, IconData icon, bool checkBox) {
    return SizedBox(
      width: 120,
      child: Column(
        children: [
          Icon(
            icon,
            color: checkBox ? AppColor.primaryColor : AppColor.greyText,
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: AppTextStyle().dmSansBody(
              color: checkBox ? AppColor.primaryColor : AppColor.greyText,
            ),
          ),
        ],
      ),
    );
  }
}
