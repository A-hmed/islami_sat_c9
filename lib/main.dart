import 'package:flutter/material.dart';
import 'package:islami_sat_c9/ui/screens/details_screen/details_screen.dart';
import 'package:islami_sat_c9/ui/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Home.routeName: (_)=> Home(),
        DetailsScreen.routeName: (_) => DetailsScreen()
      },
      initialRoute: Home.routeName,
    );
  }
}