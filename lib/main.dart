import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek1/view/section3/home1_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'cubit/filter_cubit.dart';
import 'localization/change_local.dart';
import 'localization/translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return MultiBlocProvider(

        providers: [
          BlocProvider(create: (context) => FilterCubit()),


        ],
    child:  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale:controller.language,
      fallbackLocale: Locale('en'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home1Screen(),
    )
    );
  }
}
