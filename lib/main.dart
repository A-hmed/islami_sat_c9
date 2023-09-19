import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_sat_c9/providers/settings_provider.dart';
import 'package:islami_sat_c9/ui/screens/details_screen/details_screen.dart';
import 'package:islami_sat_c9/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_sat_c9/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';
void main() {

  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  late SettingsProvider provider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: {
        Home.routeName: (_)=> Home(),
        DetailsScreen.routeName: (_) => DetailsScreen()
      },
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: provider.currentMode,
      supportedLocales: [
        Locale("en"),
        Locale("ar")
      ],
      locale: Locale(provider.currentLocale),
      initialRoute: Home.routeName,
    );
  }
}