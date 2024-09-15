import 'package:hive/hive.dart';

part 'wellness.g.dart';

@HiveType(typeId: 3)
class Wellness extends HiveObject {
  @HiveField(0)
  final String imageUrl;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String price;

  Wellness({
    required this.imageUrl,
    required this.title,
    required this.price,
  });
}
