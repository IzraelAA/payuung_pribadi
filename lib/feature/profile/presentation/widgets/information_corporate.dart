import 'package:flutter/material.dart';
import 'package:payuung_pribadi/feature/profile/presentation/manager/personal_information_provider.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';
import 'package:payuung_pribadi/utils/widgets/app_text_form_field.dart';
import 'package:provider/provider.dart';

class InformationCorporate extends StatelessWidget {
  const InformationCorporate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PersonalInformationProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            const SizedBox(height: 12),
            AppTextFormField(
              controller: provider.businessNameController,
              labelText: "Nama Usaha / Perusahaan".toUpperCase(),
              isRequired: true,
              validator: (value) => value == null || value.isEmpty
                  ? 'Field ini wajib diisi'
                  : null,
            ),
            const SizedBox(height: 12),
            AppTextFormField(
              controller: provider.businessAddressController,
              labelText: "Alamat Usaha / Perusahaan Sesuai KTP".toUpperCase(),
              isRequired: true,
              validator: (value) => value == null || value.isEmpty
                  ? 'Field ini wajib diisi'
                  : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "*",
                  style: AppTextStyle().dmSansSubtitle(color: Colors.red),
                ),
                const SizedBox(width: 4),
                Text(
                  "Jabatan".toUpperCase(),
                  style: AppTextStyle()
                      .dmSansBody(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: provider.selectedPosition,
              onChanged: (String? newValue) {
                provider.setSelectedPosition(newValue);
              },
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              validator: (value) => value == null || value.isEmpty
                  ? 'Field ini wajib diisi'
                  : null,
              items: provider.positions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: AppTextStyle()
                          .dmSansBody(fontSize: 16, color: Colors.black)),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "*",
                  style: AppTextStyle().dmSansSubtitle(color: Colors.red),
                ),
                const SizedBox(width: 4),
                Text(
                  "Lama Bekerja".toUpperCase(),
                  style: AppTextStyle()
                      .dmSansBody(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: provider.selectedWorkDuration,
              onChanged: (String? newValue) {
                provider.setSelectedWorkDuration(newValue);
              },
              validator: (value) => value == null || value.isEmpty
                  ? 'Field ini wajib diisi'
                  : null,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              items: provider.workDurations
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: AppTextStyle()
                          .dmSansBody(fontSize: 16, color: Colors.black)),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "*",
                  style: AppTextStyle().dmSansSubtitle(color: Colors.red),
                ),
                const SizedBox(width: 4),
                Text(
                  "Sumber Pendapatan".toUpperCase(),
                  style: AppTextStyle()
                      .dmSansBody(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: provider.selectedIncomeSource,
              validator: (value) => value == null || value.isEmpty
                  ? 'Field ini wajib diisi'
                  : null,
              onChanged: (String? newValue) {
                provider.setSelectedIncomeSource(newValue);
              },
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              items: provider.incomeSources
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: AppTextStyle()
                          .dmSansBody(fontSize: 16, color: Colors.black)),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            AppTextFormField(
              controller: provider.grossIncomeController,
              labelText: "Pendapatan Kotor Pertahun".toUpperCase(),
              isRequired: true,
              validator: (value) => value == null || value.isEmpty
                  ? 'Field ini wajib diisi'
                  : null,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "*",
                  style: AppTextStyle().dmSansSubtitle(color: Colors.red),
                ),
                const SizedBox(width: 4),
                Text(
                  "Nama Bank".toUpperCase(),
                  style: AppTextStyle()
                      .dmSansBody(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: provider.selectedBank,
              onChanged: (String? newValue) {
                provider.setSelectedBank(newValue);
              },
              validator: (value) => value == null || value.isEmpty
                  ? 'Field ini wajib diisi'
                  : null,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              items:
                  provider.banks.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: AppTextStyle()
                          .dmSansBody(fontSize: 16, color: Colors.black)),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            AppTextFormField(
              controller: provider.bankBranchController,
              labelText: "Cabang Bank".toUpperCase(),
              isRequired: true,
              validator: (value) => value == null || value.isEmpty
                  ? 'Field ini wajib diisi'
                  : null,
            ),
            const SizedBox(height: 12),
            AppTextFormField(
              controller: provider.accountNumberController,
              labelText: "Nomor Rekening".toUpperCase(),
              isRequired: true,
              validator: (value) => value == null || value.isEmpty
                  ? 'Field ini wajib diisi'
                  : null,
            ),
            const SizedBox(height: 12),
            AppTextFormField(
              controller: provider.accountHolderNameController,
              labelText: "Nama Pemilik Rekening".toUpperCase(),
              isRequired: true,
              validator: (value) => value == null || value.isEmpty
                  ? 'Field ini wajib diisi'
                  : null,
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
