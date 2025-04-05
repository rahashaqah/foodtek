import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends GetxController {
  Locale? language;
  changeLang(String langcode)async{
    Locale locale = Locale(langcode);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString( 'language',  langcode) ;

    Get.updateLocale(locale);
  }

  @override
  void onInit()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String sharedPrefLang = sharedPreferences.getString( "language")??"en";
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");

    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      sharedPreferences.setString( 'language',  "en") ;

    } else {
      language = Locale(Get.deviceLocale!.languageCode);

    }
    super.onInit();
  }
}
