import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/styles/my_theme_data.dart';
import 'package:todo_app/ui/home/home_screen.dart';
import 'package:todo_app/ui/home/splash/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme,
        routes: {
          SplashScreen.routeName: (_) => const SplashScreen(),
          HomeScreen.routeName: (_) => const HomeScreen(),
        },
      ),
    );
  }
}
