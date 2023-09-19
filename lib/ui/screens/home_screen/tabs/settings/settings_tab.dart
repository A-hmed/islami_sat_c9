import 'package:flutter/material.dart';
import 'package:islami_sat_c9/providers/settings_provider.dart';
import 'package:islami_sat_c9/ui/utils/app_colors.dart';
import 'package:islami_sat_c9/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  late SettingsProvider provider;
  bool arSwitchValue = false;
  bool darkSwitchValue = false;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    arSwitchValue = provider.isArEnabled();
    darkSwitchValue = provider.isDarkMode();
    var locale = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            locale.settings,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 12,),
          buildOptionRow("Ar(العربيه)", arSwitchValue, (newValue) {
            arSwitchValue = newValue;
            if(arSwitchValue){
              provider.currentLocale = "ar";
              provider.notifyListeners();

            }else {
              provider.setCurrentLocale("en");
            }
          }),
          buildOptionRow(locale.darkMode, darkSwitchValue, (newValue) {
            darkSwitchValue = newValue;
            if(darkSwitchValue){
              provider.setMode(ThemeMode.dark);
            }else {
              provider.setMode(ThemeMode.light);
            }
          })
        ],
      ),
    );
  }

  buildOptionRow(String title, bool value, Function(bool) onChanged) {
    return Row(
      children: [
        SizedBox(width: 12,),
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        Spacer(),
        Switch(value: value, onChanged: onChanged, activeColor: AppColors.primiary,)
      ],
    );
  }
}
