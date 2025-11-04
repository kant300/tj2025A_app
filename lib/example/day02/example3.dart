// [*] 상태(state) 있는 위젯
import 'package:flutter/material.dart';

void main( ){ runApp(MyApp()); }

class MyApp extends StatefulWidget{ // 1. 상태가 있는 위젯 상속받기
  // (1) extends StatefulWidget 위젯으로부터 상속받는다.
  // (2) 상태를 관리할 하위 위젯들 등록한다.
  // * 하위 위젯들은 extends State< 상위위젯명 >
  // 등록할 위젯명 createState() => 등록할위젯명();
  MyAppState createState() => new MyAppState();
}
// 2. 상태를 사용하는 위젯 별도 선언
class MyAppState extends State< MyApp >{
  int count = 0; // 변수
  // ++++++++++++++ 상태 변경 / 재렌더링 +++++++++++++++++++++++
  // setState(  (){ 새로운값; } )
  void increment(){ setState( () { count++; } ); print( count ); }
  @override
  Widget build(BuildContext context) {
    // return new MaterialApp( home: new Text("안녕하세요"),);
    return MaterialApp( home: Scaffold(  // 상단, 하단바를 나눌수있다.
      appBar : AppBar( title: Text("상단제목") ), //
      body : Center(  // 가운데 정렬
        child: Column(   // 여러개를 넣고 싶을때 ,
          children: [
            Text("count : ${ count }") ,
            TextButton(onPressed: increment, child: Text("버튼")  )
          ],
        ) ,
      ) ,
    )
    );
  }

}