import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 2)
class Address extends HiveObject {
  @HiveField(0)
  final String nik;

  @HiveField(1)
  final String address;

  @HiveField(2)
  final String postalCode;

  @HiveField(3)
  final String province;

  @HiveField(4)
  final String district;

  @HiveField(5)
  final String subDistrict;

  @HiveField(6)
  final String village;

  @HiveField(7)
  final String? ktpImagePath;

  Address({
    required this.nik,
    required this.address,
    required this.postalCode,
    required this.province,
    required this.district,
    required this.subDistrict,
    required this.village,
    this.ktpImagePath,
  });
}
