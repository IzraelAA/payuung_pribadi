import 'package:hive_flutter/adapters.dart';
import 'package:payuung_pribadi/utils/dummy_data.dart';

class AppDatabase{

  void setupHive() async {
    await Hive.initFlutter();

    var provinceBox = await Hive.openBox<String>('provinceBox');
    var districtBox = await Hive.openBox<String>('districtBox');
    var subDistrictBox = await Hive.openBox<String>('subDistrictBox');
    var villageBox = await Hive.openBox<String>('villageBox');

    provinceBox.addAll(ListDummyData().provinces);
    districtBox.addAll(ListDummyData().districts);
    subDistrictBox.addAll(ListDummyData().subDistricts);
    villageBox.addAll(ListDummyData().villages);
  }
}