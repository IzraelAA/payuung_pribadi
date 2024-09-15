import 'package:flutter/material.dart';
import 'package:payuung_pribadi/feature/profile/presentation/manager/personal_information_provider.dart';
import 'package:payuung_pribadi/feature/profile/presentation/widgets/information_corporate.dart';
import 'package:payuung_pribadi/feature/profile/presentation/widgets/personal_address.dart';
import 'package:payuung_pribadi/feature/profile/presentation/widgets/personal_data.dart';
import 'package:payuung_pribadi/utils/app_color.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';
import 'package:payuung_pribadi/utils/widgets/app_button.dart';
import 'package:provider/provider.dart'; // Import provider package

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  _PersonalInformationScreenState createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  void initState() {

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider =
      Provider.of<PersonalInformationProvider>(context, listen: false);

      provider.setSelectedField(0);
      provider.loadUserData();
      provider.loadPersonalAddressData();
      provider.loadCorporateData();
    });
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonalInformationProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDFDFD),
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
          'Informasi Pribadi',
          style: AppTextStyle().dmSansTitle(
            color: AppColor.blackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              _buildStepper(),
              _buildForm(provider),
              const SizedBox(height: 24),
              _buildNavigationButtons(provider),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              _buildStepIndicator(0),
              _buildStepDivider(1),
              _buildStepIndicator(1),
              _buildStepDivider(2),
              _buildStepIndicator(2),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 90,
                child: Text(
                  "Biodata Diri",
                  textAlign: TextAlign.center,
                  style: AppTextStyle()
                      .dmSansSubtitle(color: AppColor.primaryColor),
                )),
            SizedBox(
                width: 90,
                child: Text(
                  "Alamat Pribadi",
                  textAlign: TextAlign.center,
                  style: AppTextStyle()
                      .dmSansSubtitle(color: AppColor.primaryColor),
                )),
            SizedBox(
                width: 90,
                child: Text(
                  "Informasi perusahaan",
                  textAlign: TextAlign.center,
                  style: AppTextStyle()
                      .dmSansSubtitle(color: AppColor.primaryColor),
                )),
          ],
        ),
      ],
    );
  }

  Widget _buildStepIndicator(int step) {
    final provider = Provider.of<PersonalInformationProvider>(context);
    return GestureDetector(
      onTap: () {
        provider.setSelectedField(step);
      },
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: provider.selectedField >= step
              ? AppColor.primaryColor
              : AppColor.primaryColor.withOpacity(0.2),
        ),
        child: Text(
          "${step + 1}",
          style: AppTextStyle().dmSansTitle(),
        ),
      ),
    );
  }

  Widget _buildStepDivider(
    int step,
  ) {
    final provider = Provider.of<PersonalInformationProvider>(context);
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 1,
              color: provider.selectedField >= step - 1
                  ? AppColor.primaryColor
                  : AppColor.primaryColor.withOpacity(0.2),
            ),
          ),
          Expanded(
            child: Divider(
              height: 1,
              color: provider.selectedField >= step
                  ? AppColor.primaryColor
                  : AppColor.primaryColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(PersonalInformationProvider provider) {
    final provider = Provider.of<PersonalInformationProvider>(context);
    return provider.selectedField == 0
        ? Form(
            key: provider.formKeyPersonalData,
            child: PersonalData(),
          )
        : provider.selectedField == 1
            ? Form(
                key: provider.formKeyPersonalAddress,
                child: const PersonalAddress(),
              )
            : Form(
                key: provider.formKeyCorporateInfo,
                child: const InformationCorporate(),
              );
  }

  Widget _buildNavigationButtons(PersonalInformationProvider provider) {
    return Row(
      children: [
        if (provider.selectedField != 0) ...[
          Expanded(
            child: AppButton().primary(
              onPressed: () {
                provider.previousPage();
              },
              text: "Sebelumnya",
              color: Colors.white,
              borderColor: AppColor.primaryColor,
              textColor: AppColor.primaryColor,
            ),
          ),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: AppButton().primary(
            onPressed: () {
              provider.nextPage(context);
            },
            text: provider.selectedField == 2 ? "Simpan" : "Selanjutnya",
          ),
        ),
      ],
    );
  }
}
