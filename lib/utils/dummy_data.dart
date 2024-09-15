import 'package:payuung_pribadi/feature/dashboard/data/models/wellness.dart';

class ListDummyData {
// Dummy data for dropdowns
  List<String> provinces = ['Jawa Barat', 'Jawa Timur', 'Bali', ''];
  List<String> districts = ['Bandung', 'Surabaya', 'Denpasar', ''];
  List<String> subDistricts = ['Cibiru', 'Sukolilo', 'Kuta', ''];
  List<String> villages = ['Cisarua', 'Kedungdung', 'Seminyak', ''];

  final List<Wellness> dummyData = [
    Wellness(
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPGz1ghgWygI35RatkZtCYoQFP7IgM0psDrw&s",
      title: "Voucher H&M",
      price: "Rp 100.000",
    ),
    Wellness(
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Logo_Indomaret.png/800px-Logo_Indomaret.png",
      title: "Voucher Indomaret",
      price: "Rp 25.000",
    ),
    Wellness(
      imageUrl: "https://upload.wikimedia.org/wikipedia/id/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/800px-Starbucks_Corporation_Logo_2011.svg.png",
      title: "Voucher Starbucks",
      price: "Rp 50.000",
    ),
    Wellness(
      imageUrl: "https://seeklogo.com/images/A/alfamart-logo-13EE0761D0-seeklogo.com.png",
      title: "Voucher Alfamart",
      price: "Rp 30.000",
    ),
    Wellness(
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/7/7c/Excelso.png",
      title: "Voucher Excelso",
      price: "Rp 40.000",
    ),
    Wellness(
      imageUrl: "https://bakmigmkids.com/bundle/default/assets/img/logo/bakmigm.png",
      title: "Voucher Bakmi Gm",
      price: "Rp 60.000",
    ),
  ];
}
