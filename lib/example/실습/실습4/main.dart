
import 'package:flutter/material.dart';
import 'package:tj2025app/example/실습/실습4/pages/CreatePage.dart';
import 'package:tj2025app/example/실습/실습4/pages/HomePage.dart';
import 'package:tj2025app/example/day04/pages/MainPage.dart';
import 'package:tj2025app/example/day04/pages/FindAllPages.dart';


void main(){
  runApp( MyApp() );

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",

      routes: {
        "/" : (context) => MainPage() ,
        "/home" : (context) => HomePage(),
        "/create" : (context) => CreatePage(),
        "/findall" : (context) => FindAllPages(),




      },

    );
  }
}