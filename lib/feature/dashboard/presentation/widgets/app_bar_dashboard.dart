import 'package:flutter/material.dart';
import 'package:payuung_pribadi/feature/profile/presentation/manager/personal_information_provider.dart';
import 'package:payuung_pribadi/feature/profile/presentation/pages/profile_screen.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';
import 'package:provider/provider.dart';

class AppBarDashboard extends StatelessWidget {
  const AppBarDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<PersonalInformationProvider>(
        builder: (context, provider, child) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 32,
          left: 12,
          right: 12,
          bottom: 12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Pagi",
                    style: AppTextStyle().dmSansSubtitle(),
                  ),
                  Text(
                    provider.nameController.text,
                    style: AppTextStyle().dmSansHeading(),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              child: Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColor.cardHeader2,
                    borderRadius: BorderRadius.circular(100)),
                child: Text(
                  provider.nameController.text[0],
                  style: AppTextStyle().dmSansHeading(),
                ),
              ),
            )
          ],
        ),
      );}
    );
  }
}
