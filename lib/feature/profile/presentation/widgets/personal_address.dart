import 'dart:io';

import 'package:flutter/material.dart';
import 'package:payuung_pribadi/feature/profile/presentation/manager/personal_information_provider.dart';
import 'package:payuung_pribadi/utils/dummy_data.dart';
import 'package:payuung_pribadi/utils/widgets/app_text_form_field.dart';
import 'package:provider/provider.dart'; // Import provider package

class PersonalAddress extends StatelessWidget {
  const PersonalAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonalInformationProvider>(context);

    return Column(
      children: [
        ElevatedButton(
          onPressed: provider.pickKTPImage,
          child: const Text('Upload KTP'),
        ),
        if (provider.ktpImage != null)
          Image.file(
            File(provider.ktpImage!.path),
            height: 150,
            width: 150,
          ),
        const SizedBox(height: 12),
        AppTextFormField(
          controller: provider.nikController,
          labelText: 'NIK'.toUpperCase(),
          isRequired: true,
          validator: (value) => value == null || value.isEmpty ? 'NIK' : null,
        ),
        const SizedBox(height: 12),
        AppTextFormField(
          controller: provider.addressController,
          labelText: 'Alamat Sesuai KTP'.toUpperCase(),
          isRequired: true,
          validator: (value) =>
              value == null || value.isEmpty ? 'Alamat Sesuai KTP' : null,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(width: 4),
            Text(
              'Provinsi'.toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: provider.selectedProvince,
          validator: (value) =>
              value == null || value.isEmpty ? 'Provinsi' : null,
          onChanged: (String? newValue) {
            provider.setSelectedProvince(newValue);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: ListDummyData()
              .provinces
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(width: 4),
            Text(
              'Kabupaten'.toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: provider.selectedDistrict,
          validator: (value) =>
              value == null || value.isEmpty ? 'Kabupaten' : null,
          onChanged: (String? newValue) {
            provider.setSelectedDistrict(newValue);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: ListDummyData()
              .districts
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(width: 4),
            Text(
              'Kecamatan'.toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: provider.selectedSubDistrict,
          onChanged: (String? newValue) {
            provider.setSelectedSubDistrict(newValue);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validator: (value) =>
              value == null || value.isEmpty ? 'Kecamatan' : null,
          items: ListDummyData()
              .subDistricts
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              "*",
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(width: 4),
            Text(
              'Kelurahan'.toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          value: provider.selectedVillage,
          onChanged: (String? newValue) {
            provider.setSelectedVillage(newValue);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          items: ListDummyData()
              .villages
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          validator: (value) =>
              value == null || value.isEmpty ? 'Kelurahan' : null,
        ),
        const SizedBox(height: 12),
        AppTextFormField(
          controller: provider.postalCodeController,
          labelText: 'Kode Pos'.toUpperCase(),
          isRequired: true,
          validator: (value) =>
              value == null || value.isEmpty ? 'Isi kode post' : null,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
