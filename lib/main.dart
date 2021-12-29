import 'dart:io';
import 'package:ehay/config/routes/app_routes.dart';
import 'package:ehay/constants/app_color.dart';
import 'package:ehay/module/model/bin.dart';
import 'package:ehay/module/model/category.dart';
import 'package:ehay/module/model/item.dart';
import 'package:ehay/module/model/tag.dart';
import 'package:ehay/utils/helper/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  var dir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(TagAdapter());
  Hive.registerAdapter(BinAdapter());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zebboi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.rubikTextTheme(),
        scaffoldBackgroundColor: const Color(0xffF8F8F8),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          color: kAppBgColor,
          titleSpacing: 0.0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: kDark,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: AppRoute.splashPage,
      defaultTransition: Transition.cupertino,
      getPages: AppRoute.getPage,
      builder: EasyLoading.init(),
    );
  }
}
