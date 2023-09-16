import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sat_c9/model/details_screen_args.dart';
import 'package:islami_sat_c9/ui/utils/app_assets.dart';
import 'package:islami_sat_c9/ui/utils/app_colors.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = "details screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if(fileContent.isEmpty) {
      readFile(args.fileName, args.isQuranFile);
    }

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
          title: Text(args.screenTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.accent, fontSize: 30),),
        ),
        body:fileContent.isNotEmpty ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(fileContent,textAlign: TextAlign.center,
                // textDirection: TextDirection.rtl,
                style: const TextStyle(fontSize: 24, color: AppColors.accent),),
            ))
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

   readFile(String fileName, bool isQuranFile) {
    Future<String> futureFileContent = rootBundle.loadString(isQuranFile?
        "assets/files/$fileName" :   "assets/files/ahadeth/$fileName"
    );
    futureFileContent.then((file) {
      if(!isQuranFile){
        fileContent = file;
        setState(() {});
        return ;
      }
      List<String> fileLines = file.split("\n");
      for(int i = 0; i< fileLines.length; i++){
        fileLines[i] += "(${i+1})";
      }
      fileContent = fileLines.join();
      setState(() {});
    });
  }
}
