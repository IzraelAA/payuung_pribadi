import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';

class SelectedCategory extends StatelessWidget {
  SelectedCategory({super.key});

  final List category = [
    'Hobi',
    'Merchandise',
    'Gaya Hidup\nSehat',
    'Konseling &\nRohani',
    'Self\nDevelopment',
    'Perencanaan\nKeuangan',
    'Konsultasi\nMedis',
    'Lihat Semua',
  ];

  final List<SvgPicture> categoryIcon = [
    SvgPicture.asset(
      'assets/svg/hobi.svg',
      width: 30,
      height: 30,
      color: const Color(0xff3198d8),
    ),
    SvgPicture.asset(
      'assets/svg/merchandise.svg',
      width: 30,
      height: 30,
      color: const Color(0xff3597d9),
    ),
    SvgPicture.asset(
      'assets/svg/gaya_hidup.svg',
      width: 30,
      height: 30,
      color: const Color(0xffd75143),
    ),
    SvgPicture.asset(
      'assets/svg/konseling.svg',
      width: 30,
      height: 30,
      color: const Color(0xff0096e5),
    ),
    SvgPicture.asset(
      'assets/svg/self_development.svg',
      width: 30,
      height: 30,
      color: const Color(0xff5458bb),
    ),
    SvgPicture.asset(
      'assets/svg/keuangan.svg',
      width: 30,
      height: 30,
      color: const Color(0xff33c76c),
    ),
    SvgPicture.asset(
      'assets/svg/medis.svg',
      width: 30,
      height: 30,
      color: const Color(0xFF2EA860),
    ),
    SvgPicture.asset(
      'assets/svg/lihat_semua.svg',
      width: 30,
      height: 30,
      color: const Color(0xFF32414D),
    ),
  ];

  final int itemsPerRow = 4; // Jumlah item per baris

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kategori Pilihan',
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
                'Wishlist',
                style: AppTextStyle().dmSansBody(
                  color: AppColor.blackColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Membuat grid secara manual menggunakan Row dan Column
        Column(
          children: _buildRows(),
        )
      ],
    );
  }

  // Fungsi untuk membangun daftar Row
  List<Widget> _buildRows() {
    List<Widget> rows = [];
    for (int i = 0; i < category.length; i += itemsPerRow) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildRowItems(i),
        ),
      );
      rows.add(SizedBox(height: 12)); // Jarak antar baris
    }
    return rows;
  }

  // Fungsi untuk membangun item dalam setiap Row
  List<Widget> _buildRowItems(int startIndex) {
    List<Widget> rowItems = [];
    for (int i = startIndex; i < startIndex + itemsPerRow; i++) {
      if (i < category.length) {
        rowItems.add(
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: categoryIcon[i],
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  height: 40,
                  child: Text(
                    category[i],
                    style: AppTextStyle().dmSansBody(
                      color: AppColor.blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        rowItems.add(Expanded(child: Container())); // Untuk mengisi space kosong di baris
      }
    }
    return rowItems;
  }
}
