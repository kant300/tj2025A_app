import 'package:flutter/material.dart';
import 'package:tj2025app/example/day04/pages/HomePage.dart';

class MainPage extends StatefulWidget{
  MainPageState createState() => MainPageState();
}
class MainPageState extends State<MainPage>{ // 상태(state)가 있는 위젯
  int currentPageIndex = 0;
  // 인덱스별 위젯(페이지)목록
  dynamic pages = [ // vs List<Widget> pages = [];
    HomePage() , // 인덱스 0 -> 홈 페이지
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( index:  currentPageIndex, children: pages,) ,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPageIndex,// 현재 선택된 버튼 번호 설정
          onTap: (index){ setState(() { currentPageIndex = index; }); } ,  // 바텀메뉴 중 하나의 탭 눌렀을때
          items: [  //  바텀메뉴에 들어갈 메뉴들
            BottomNavigationBarItem( icon: Icon(Icons.home_outlined) , label: "홈") , // 0번
          ]
      ),
    );
  }

}