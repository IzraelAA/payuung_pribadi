import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:payuung_pribadi/feature/dashboard/presentation/widgets/app_bar_dashboard.dart';
import 'package:payuung_pribadi/feature/dashboard/presentation/widgets/explore_wellness.dart';
import 'package:payuung_pribadi/feature/dashboard/presentation/widgets/financial_products.dart';
import 'package:payuung_pribadi/feature/dashboard/presentation/widgets/header_dashboard.dart';
import 'package:payuung_pribadi/feature/dashboard/presentation/widgets/nav_bar.dart';
import 'package:payuung_pribadi/feature/dashboard/presentation/widgets/selected_category.dart';
import 'package:payuung_pribadi/feature/profile/data/models/user_model.dart';
import 'package:payuung_pribadi/utils/app_color.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    saveData();
  }

  Future<void> saveData() async {
    final box = Hive.box<User>('userBox');
    final user = box.get(0);
    if (user == null) {
      final user = User(
        name: "Panca Adnan",
        gender: "",
        email: "acari.panca21@gmail.com",
        phone: "",
        education: "",
        materialStatus: "",
      );
      await box.put(0, user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      left: false,
      right: false,
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const AppBarDashboard(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        children: [
                          const HeaderDashboard(),
                          const SizedBox(
                            height: 12,
                          ),
                          const FinancialProducts(),
                          const SizedBox(
                            height: 12,
                          ),
                          SelectedCategory(),
                          const SizedBox(
                            height: 12,
                          ),
                          const ExploreWellness(),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}
