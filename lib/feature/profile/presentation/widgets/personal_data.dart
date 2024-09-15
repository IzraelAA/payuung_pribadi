import 'package:flutter/material.dart';
import 'package:payuung_pribadi/feature/profile/presentation/manager/personal_information_provider.dart';
import 'package:payuung_pribadi/utils/app_text_style.dart';
import 'package:payuung_pribadi/utils/widgets/app_text_form_field.dart';
import 'package:provider/provider.dart';

class PersonalData extends StatelessWidget {
  PersonalData({super.key});

  final List<String> _educations = [
    'SMA/SMK',
    'Diploma',
    'Sarjana',
    'Magister',
    'Doktor',
    ''
  ];
  final List<String> _maritalStatuses = [
    'Belum Menikah',
    'Menikah',
    'Cerai',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PersonalInformationProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            AppTextFormField(
              controller: provider.nameController,
              labelText: "Nama Lengkap".toUpperCase(),
              isRequired: true,
              validator: (value) => value == null || value.isEmpty
                  ? 'Field ini wajib diisi'
                  : null,
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null &&
                    pickedDate != provider.selectedDate) {
                  provider.setSelectedDate(pickedDate);
                }
              },
              child: AbsorbPointer(
                child: AppTextFormField(
                  labelText: "Tanggal Lahir".toUpperCase(),
                  controller: TextEditingController(
                    text: provider.selectedDate != null
                        ? '${provider.selectedDate!.day}-${provider.selectedDate!.month}-${provider.selectedDate!.year}'
                        : '',
                  ),
                  isRequired: true,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Pilih Tanggal Lahir'
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "*",
                  style: AppTextStyle().dmSansSubtitle(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  "Jenis Kelamin".toUpperCase(),
                  style: AppTextStyle().dmSansBody(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: provider.selectedGender,
              onChanged: (String? newValue) {
                provider.setSelectedGender(newValue);
              },
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              items: ['Pria', 'Wanita', '']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: AppTextStyle().dmSansBody(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
              validator: (value) => value == null || value.isEmpty
                  ? 'Pilih jenis kelamin'
                  : null,
            ),
            const SizedBox(height: 12),
            AppTextFormField(
              controller: provider.emailController,
              labelText: "Alamat Email".toUpperCase(),
              isRequired: true,
              enabled: false,
            ),
            const SizedBox(height: 12),
            AppTextFormField(
              controller: provider.phoneController,
              labelText: "NO. HP".toUpperCase(),
              isRequired: true,
              validator: (value) => value == null || value.isEmpty
                  ? 'Pilih NO. HP'
                  : null,
            ),
            const SizedBox(height: 12),
            Text(
              "Status Pernikahan".toUpperCase(),
              style: AppTextStyle().dmSansBody(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: provider.selectedEducation,
              onChanged: (String? newValue) {
                provider.setSelectedEducation(newValue);
              },
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              items:
                  _educations.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: AppTextStyle().dmSansBody(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            Text(
              "Status Pernikahan".toUpperCase(),
              style: AppTextStyle().dmSansBody(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: provider.selectedMaritalStatus,
              onChanged: (String? newValue) {
                provider.setSelectedMaritalStatus(newValue);
              },
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
              items: _maritalStatuses
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: AppTextStyle().dmSansBody(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
