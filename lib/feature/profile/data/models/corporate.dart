import 'package:hive/hive.dart';

part 'corporate.g.dart';

@HiveType(typeId: 1)
class Corporate extends HiveObject {
  @HiveField(0)
  final String businessName;

  @HiveField(1)
  final String businessAddress;

  @HiveField(2)
  final String position;

  @HiveField(3)
  final String workDuration;

  @HiveField(4)
  final String incomeSource;

  @HiveField(5)
  final String bank;

  @HiveField(6)
  final String bankBranch;

  @HiveField(7)
  final String accountNumber;

  @HiveField(8)
  final String accountHolderName;

  @HiveField(9)
  final String grossIncome;

  Corporate({
    required this.businessName,
    required this.businessAddress,
    required this.position,
    required this.workDuration,
    required this.incomeSource,
    required this.bank,
    required this.bankBranch,
    required this.accountNumber,
    required this.accountHolderName,
    required this.grossIncome,
  });
}
