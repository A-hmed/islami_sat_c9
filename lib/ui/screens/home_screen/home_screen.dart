import 'package:flutter/material.dart';
import 'package:islami_sat_c9/ui/screens/home_screen/tabs/quran_tab/quran_tab.dart';
import 'package:islami_sat_c9/ui/utils/app_assets.dart';
import 'package:islami_sat_c9/ui/utils/app_colors.dart';
import 'tabs/ahadeth_tab/ahadeth_tab.dart';
import 'tabs/radio_tab/radio_tab.dart';
import 'tabs/sebha_tab/sebha_tab.dart';

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
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.background), fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          title: const Text("Islami",
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.accent, fontSize: 30),),
        ),
        body: tabs[currentTabIndex],
        bottomNavigationBar: buildBottomNavigation(),
      ),
    );
  }

  Widget buildBottomNavigation() => Theme(
    data: Theme.of(context).copyWith(canvasColor: AppColors.primiary),
    child: BottomNavigationBar(
      onTap: (index){
        currentTabIndex = index;
        setState(() {});
      },
      currentIndex: currentTabIndex,
      selectedItemColor: AppColors.accent,
      iconSize: 35,
      items: const [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icQuran)),label: "Quran"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),label: "Ahadeth"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSebha)),label: "Sebha"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)),label: "Radio"),
      ],
    ),
  );
}
