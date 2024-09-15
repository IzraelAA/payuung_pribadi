import 'package:flutter/material.dart';
import 'package:payuung_pribadi/feature/profile/presentation/manager/personal_information_provider.dart';
import 'package:payuung_pribadi/feature/profile/presentation/pages/personal_information.dart';
import 'package:payuung_pribadi/feature/profile/presentation/widgets/selected_item.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<PersonalInformationProvider>(
        builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade100,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 15,
              ),
            ),
            title: Text(
              'Profile',
              style: AppTextStyle().dmSansTitle(
                color: AppColor.blackColor,
              ),
            ),
            centerTitle: true,
          ),
          body: Container(
            width: double.infinity,
            color: Colors.grey.shade100,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 28,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 60,
                          margin: const EdgeInsets.all(5),
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.cardHeader2,
                              borderRadius: BorderRadius.circular(100)),
                          child: Text(
                            provider.nameController.text[0],
                            style: AppTextStyle().dmSansHeading(fontSize: 30),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                shape: BoxShape.circle),
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                size: 20,
                                Icons.camera_alt,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.nameController.text,
                          style: AppTextStyle().dmSansHeading(
                            color: AppColor.blackColor,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Masuk dengan Google',
                          style: AppTextStyle().dmSansBody(
                            fontSize: 15,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 44,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  PersonalInformationScreen(),
                      ),
                    );
                  },
                  child: const ProfileInfoCard(
                    title: 'Informasi Pribadi',
                    icon: Icon(
                      Icons.account_circle_outlined,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
