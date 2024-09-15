import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payuung_pribadi/feature/profile/data/models/address.dart';
import 'package:payuung_pribadi/feature/profile/data/models/corporate.dart';
import 'package:payuung_pribadi/feature/profile/data/models/user_model.dart';

class PersonalInformationProvider extends ChangeNotifier {
  int selectedField = 0;
  final GlobalKey<FormState> formKeyPersonalData = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyPersonalAddress = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyCorporateInfo = GlobalKey<FormState>();

  String? selectedGender;
  String? selectedEducation;
  String? selectedMaritalStatus;
  DateTime? selectedDate;

  // Controllers for the text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
 
 
  // Address Information Variables
  final TextEditingController nikController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  String? selectedProvince;
  String? selectedDistrict;
  String? selectedSubDistrict;
  String? selectedVillage;
  XFile? ktpImage;

  final ImagePicker picker = ImagePicker();


  // Controllers
  final businessNameController = TextEditingController();
  final businessAddressController = TextEditingController();
  final bankBranchController = TextEditingController();
  final accountNumberController = TextEditingController();
  final accountHolderNameController = TextEditingController();
  final grossIncomeController = TextEditingController();

  // Dropdown values
  final List<String> positions = ['Manager', 'Staff', 'Intern'];
  final List<String> workDurations = [
    'Less than a year',
    '1-3 years',
    '3-5 years',
    'More than 5 years'
  ];
  final List<String> incomeSources = ['Salary', 'Business', 'Investment'];
  final List<String> banks = ['Bank A', 'Bank B', 'Bank C'];

  String? selectedPosition;
  String? selectedWorkDuration;
  String? selectedIncomeSource;
  String? selectedBank;

  // Setters for updating state
  void setSelectedGender(String? value) {
    selectedGender = value;
    notifyListeners();
  }

  // Setters for updating state
  void setSelectedField(int i) {
    selectedField = i;
    notifyListeners();
  }

  void setSelectedEducation(String? value) {
    selectedEducation = value;
    notifyListeners();
  }

  void setSelectedMaritalStatus(String? value) {
    selectedMaritalStatus = value;
    notifyListeners();
  }

  void setSelectedDate(DateTime? date) {
    selectedDate = date;
    notifyListeners();
  }

  void setSelectedProvince(String? value) {
    selectedProvince = value;
    notifyListeners();
  }

  void setSelectedDistrict(String? value) {
    selectedDistrict = value;
    notifyListeners();
  }

  void setSelectedSubDistrict(String? value) {
    selectedSubDistrict = value;
    notifyListeners();
  }

  void setSelectedVillage(String? value) {
    selectedVillage = value;
    notifyListeners();
  }

  void setKTPImage(XFile? image) {
    ktpImage = image;
    notifyListeners();
  }

  // Load user data from Hive
  void loadUserData() async {
    final box = Hive.box<User>('userBox');
    final user = box.get(0); // Ambil data pengguna dengan ID 0
    if (user != null) {
      nameController.text = user.name;
      selectedDate = user.birthDate;
      selectedGender = user.gender;
      selectedEducation = user.education;
      selectedMaritalStatus = user.materialStatus;
      emailController.text = user.email;
      phoneController.text = user.phone;
      notifyListeners();
    }
  }

  // Save user data to Hive
  void saveUserData() async {
    final box = Hive.box<User>('userBox');
    final user = User(
      name: nameController.text,
      birthDate: selectedDate,
      gender: selectedGender ?? "",
      email: emailController.text,
      phone: phoneController.text,
      education: selectedEducation ?? "",
      materialStatus: selectedMaritalStatus ?? "",
    );
    print(user.toString());
    print(user.name);
    print(nameController.text);
    print(emailController.text);
    print(emailController.text);
    print(selectedEducation);
    print("user.toString()");
    await box.put(0, user); // Simpan data pengguna dengan ID 0
  }

  // Load personal address data from Hive
  void loadPersonalAddressData() async {
    final box = Hive.box<Address>('personalAddressBox');
    final address = box.get(0);
    if (address != null) {
      nikController.text = address.nik;
      addressController.text = address.address;
      postalCodeController.text = address.postalCode;
      selectedProvince = address.province;
      selectedDistrict = address.district;
      selectedSubDistrict = address.subDistrict;
      selectedVillage = address.village;
      if (address.ktpImagePath != null) {
        ktpImage = XFile(address.ktpImagePath!);
      }
      notifyListeners();
    }
  }

  // Save personal address data to Hive
  void savePersonalAddressData() async {
    final box = Hive.box<Address>('personalAddressBox');
    final address = Address(
      nik: nikController.text,
      address: addressController.text,
      postalCode: postalCodeController.text,
      province: selectedProvince ?? "",
      district: selectedDistrict ?? "",
      subDistrict: selectedSubDistrict ?? "",
      village: selectedVillage ?? "",
      ktpImagePath: ktpImage?.path,
    );
    await box.put(0, address);
  }

  Future<void> pickKTPImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      ktpImage = pickedFile;
      notifyListeners();
    }
  }

  Future<void> nextPage(BuildContext context) async {
    if (validateForm()) {
      await Future.delayed(
        Duration(seconds: 1),
        () {
          if (selectedField == 0) {
            saveUserData();
          } else if (selectedField == 1) {
            savePersonalAddressData();
          } else {
            saveCorporateData();
          }
        },
      );
      if (selectedField < 2) {
        selectedField += 1;
      } else {
        Navigator.pop(context);
        Navigator.pop(context);
      }
      notifyListeners();
    }
  }

  void previousPage() {
    if (selectedField > 0) {
      selectedField -= 1;
    }
    notifyListeners();
  }

  bool validateForm() {
    if (selectedField == 0) {
      return formKeyPersonalData.currentState!.validate();
    } else if (selectedField == 1) {
      return formKeyPersonalAddress.currentState!.validate();
    } else if (selectedField == 2) {
      return formKeyCorporateInfo.currentState!.validate();
    }
    return false;
  }

  void saveData(BuildContext context) {
    if (validateForm()) {
      Navigator.pop(context);
    }
  }

  void setSelectedPosition(String? value) {
    selectedPosition = value;
    notifyListeners();
  }

  void setSelectedWorkDuration(String? value) {
    selectedWorkDuration = value;
    notifyListeners();
  }

  void setSelectedIncomeSource(String? value) {
    selectedIncomeSource = value;
    notifyListeners();
  }

  void setSelectedBank(String? value) {
    selectedBank = value;
    notifyListeners();
  }

  // Save corporate data to Hive
  void saveCorporateData() async {
    final box = Hive.box<Corporate>('corporateBox');
    final corporate = Corporate(
      businessName: businessNameController.text,
      businessAddress: businessAddressController.text,
      position: selectedPosition ?? "",
      workDuration: selectedWorkDuration ?? "",
      incomeSource: selectedIncomeSource ?? "",
      bank: selectedBank ?? "",
      bankBranch: bankBranchController.text,
      accountNumber: accountNumberController.text,
      accountHolderName: accountHolderNameController.text,
      grossIncome: grossIncomeController.text,
    );
    await box.put(0, corporate);
  }
  void loadCorporateData() async {
    final box = Hive.box<Corporate>('corporateBox');

    // Check if data exists in the box
    if (box.isNotEmpty) {
      final corporate = box.get(0) as Corporate?;

      // If data is available, update the state or variables
      if (corporate != null) {
        // Update the controllers or state variables with the loaded data
        businessNameController.text = corporate.businessName;
        businessAddressController.text = corporate.businessAddress;
        selectedPosition = corporate.position;
        selectedWorkDuration = corporate.workDuration;
        selectedIncomeSource = corporate.incomeSource;
        selectedBank = corporate.bank;
        bankBranchController.text = corporate.bankBranch;
        accountNumberController.text = corporate.accountNumber;
        accountHolderNameController.text = corporate.accountHolderName;
        grossIncomeController.text = corporate.grossIncome;

        // Optionally, notify listeners if using a provider or similar
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    businessNameController.dispose();
    businessAddressController.dispose();
    bankBranchController.dispose();
    accountNumberController.dispose();
    accountHolderNameController.dispose();
    grossIncomeController.dispose();
    super.dispose();
  }
}
