import 'package:flutter/material.dart';
import 'package:tj2025app/example/실습/실습4/pages/CreatePage.dart';
import 'package:tj2025app/example/실습/실습4/pages/HomePage.dart';
import 'package:tj2025app/example/실습/실습4/pages/FindAllPages.dart';



class MainPage extends StatefulWidget{
  MainPageState createState() => MainPageState();
}
class MainPageState extends State<MainPage>{
  int currentPageIndex = 0 ;
  dynamic pages = [
    HomePage(),
    CreatePage() ,
    findAllPages() ,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( index: currentPageIndex, children: pages,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index){setState(() { currentPageIndex = index; } ); },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined , size: 30 , ) ,
              label: "홈" ),
          BottomNavigationBarItem(
              icon: Icon(Icons.input_outlined , size: 30 , ) ,
              label: "등록"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined, size: 30 , ) ,
              label: "전체조회")
        ],
      ),

    );
  }
}
