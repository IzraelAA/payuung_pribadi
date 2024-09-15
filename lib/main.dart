import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:payuung_pribadi/core/app_database.dart';
import 'package:payuung_pribadi/feature/dashboard/data/models/wellness.dart';
import 'package:payuung_pribadi/feature/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:payuung_pribadi/feature/profile/data/models/address.dart';
import 'package:payuung_pribadi/feature/profile/data/models/corporate.dart';
import 'package:payuung_pribadi/feature/profile/data/models/user_model.dart';
import 'package:payuung_pribadi/feature/profile/presentation/manager/personal_information_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Daftarkan adapter Hive
  Hive.registerAdapter(WellnessAdapter());
  Hive.registerAdapter(UserAdapter());

  Hive.registerAdapter(CorporateAdapter());
  Hive.registerAdapter(AddressAdapter());

  await Hive.openBox<Wellness>('wellnessBox');
  await Hive.openBox<Address>('personalAddressBox');
  await Hive.openBox<Corporate>('corporateBox');
  await Hive.openBox<User>('userBox');
  AppDatabase().setupHive();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => PersonalInformationProvider()..loadUserData()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
