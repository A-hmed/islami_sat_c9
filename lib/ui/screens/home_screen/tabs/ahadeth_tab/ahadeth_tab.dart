import 'package:flutter/material.dart';

import '../../../../../model/details_screen_args.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/constants.dart';
import '../../../details_screen/details_screen.dart';

class AhadethTab extends StatelessWidget {

   List<String> ahadethNames = List.generate(50, (index) => " ${index+1}الحديث رقم ");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(AppAssets.ahadethTabLogo)),
        const Divider(thickness: 3,color: AppColors.primiary,),
        const Text("Hadeth Name",textAlign: TextAlign.center ,style: AppTheme.quranTabTitleTextStyle,),
        const Divider(thickness: 3,color: AppColors.primiary,),
        Expanded(flex: 7,
          child: ListView.separated(
              itemCount: ahadethNames.length,
              separatorBuilder: (__, _){
                return const Divider(thickness: 3,color: AppColors.primiary,);
              },
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, DetailsScreen.routeName,
                        arguments: DetailsScreenArgs(fileName: "h${index+1}.txt",
                            screenTitle: ahadethNames[index], isQuranFile: false));
                  },
                  child: Text(ahadethNames[index],
                    textAlign: TextAlign.center,
                    style: AppTheme.quranTabTitleTextStyle.copyWith(fontWeight: FontWeight.normal),),
                );
              }),),
      ],
    );
  }
}
