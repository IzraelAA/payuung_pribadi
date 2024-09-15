import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';

class FinancialProducts extends StatefulWidget {
  const FinancialProducts({super.key});

  @override
  State<FinancialProducts> createState() => _FinancialProductsState();
}

class _FinancialProductsState extends State<FinancialProducts> {
  List category = [
    'Urun',
    'Pembiayaan\nPorsi Haji',
    'Financial\nCheck Up',
    'Asuransi\nMobil',
    'Asuransi\nProperti',
    // Tambah lebih banyak kategori jika diperlukan
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

  final int itemsPerRow = 4; // Jumlah item per baris

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
        Column(
          children: _buildRows(), // Buat grid dinamis
        )
      ],
    );
  }

  // Fungsi untuk membangun daftar Row berdasarkan jumlah item per baris
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

  // Fungsi untuk membangun item di setiap Row
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
        rowItems.add(
            Expanded(child: Container())); // Untuk menjaga layout tetap rapi
      }
    }
    return rowItems;
  }
}
