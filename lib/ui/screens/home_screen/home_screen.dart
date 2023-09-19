import 'package:flutter/material.dart';
import 'package:islami_sat_c9/providers/settings_provider.dart';
import 'package:islami_sat_c9/ui/screens/home_screen/tabs/quran_tab/quran_tab.dart';
import 'package:islami_sat_c9/ui/screens/home_screen/tabs/settings/settings_tab.dart';
import 'package:islami_sat_c9/ui/utils/app_assets.dart';
import 'package:islami_sat_c9/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'tabs/ahadeth_tab/ahadeth_tab.dart';
import 'tabs/radio_tab/radio_tab.dart';
import 'tabs/sebha_tab/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Home extends StatefulWidget {
  static const routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];
  late SettingsProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage(
            provider.currentMode == ThemeMode.light ? AppAssets.background : AppAssets.backgroundDark), fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
           title: Text(AppLocalizations.of(context)!.islami,)),
        body: tabs[currentTabIndex],
        bottomNavigationBar: buildBottomNavigation(),
      ),
    );
  }

  Widget buildBottomNavigation() => Theme(
    data: Theme.of(context).copyWith(canvasColor: provider.currentMode == ThemeMode.light?
    AppColors.primiary: AppColors.primiaryDark),
    child: BottomNavigationBar(
      onTap: (index){
        currentTabIndex = index;
        setState(() {});
      },
      currentIndex: currentTabIndex,
      items: [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icQuran)),label: "Quran"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),label: "Ahadeth"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSebha)),label: "Sebha"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)),label: "Radio"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: AppLocalizations.of(context)!.settings),
      ],
    ),
  );
}
