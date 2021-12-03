import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:turtle_game/binding/main_binding.dart';
import 'package:turtle_game/pages/ending/ending_model.dart';
import '../constants/constants.dart';
import '../generated/locales.g.dart';
import '../routes/app_pages.dart';
import '../shared/logger/logger_utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    EndingModel.init();
    return GetMaterialApp(
      locale: Locale(Constants.defaultLocale),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
      translationsKeys: AppTranslation.translations,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
