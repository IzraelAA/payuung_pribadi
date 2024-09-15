import 'package:hive/hive.dart';

part 'user_model.g.dart'; // Akan dihasilkan secara otomatis

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final DateTime? birthDate;

  @HiveField(2)
  final String gender;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final String education;
  @HiveField(6)
  final String materialStatus;

  User({
    required this.name,
    this.birthDate,
    required this.gender,
    required this.email,
    required this.phone,
    required this.education,
    required this.materialStatus,
  });
}
