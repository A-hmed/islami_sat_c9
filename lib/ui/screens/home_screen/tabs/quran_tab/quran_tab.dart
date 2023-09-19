import 'package:flutter/material.dart';
import 'package:islami_sat_c9/model/details_screen_args.dart';
import 'package:islami_sat_c9/ui/screens/details_screen/details_screen.dart';
import 'package:islami_sat_c9/ui/utils/app_assets.dart';
import 'package:islami_sat_c9/ui/utils/app_colors.dart';
import 'package:islami_sat_c9/ui/utils/app_theme.dart';
import 'package:islami_sat_c9/ui/utils/constants.dart';

class QuranTab extends StatelessWidget {

  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(AppAssets.quranTabLogo)),
        const Divider(),
        const Text("Sura Name",textAlign: TextAlign.center ,
          style: AppTheme.quranTabTitleTextStyle,),
        const Divider(),
        Expanded(flex: 7,
         child: ListView.separated(
             itemCount: Constants.suraNames.length,
              separatorBuilder: (__, _){
               return const Divider(thickness: 3,color: AppColors.primiary,);
              },
             itemBuilder: (context, index){
               return InkWell(
                 onTap: (){
                   Navigator.pushNamed(context, DetailsScreen.routeName,
                    arguments: DetailsScreenArgs(fileName: "${index+1}.txt",
                        screenTitle: Constants.suraNames[index], isQuranFile: true));
                 },
                 child: Text(Constants.suraNames[index],
                   textAlign: TextAlign.center,
                   style: AppTheme.quranTabTitleTextStyle.copyWith(fontWeight: FontWeight.normal),),
               );
             }),),
      ],
    );
  }
}
