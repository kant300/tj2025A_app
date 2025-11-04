import 'package:flutter/material.dart';

// [2] 최초로 실행할 위젯, main 함수 안에서 runApp 함수 이용한 위젯 실행
void main(){ runApp(new MyApp());}

// [1] 상태가 없는 위젯
class MyApp extends StatelessWidget{ // [1-1] StatelessWidget 상속받는다.
  // [1-3] 이벤트
  int count = 0; // 변수
  void increment(){ count++; print(count); } // 함수
  // [1-2] build 함수 재구현
  @override
  Widget build(BuildContext context) {
    // return new MaterialApp( home: new Text("안녕하세요"),);
    return MaterialApp( home: Scaffold(
      appBar : AppBar( title: Text("상단제목") ),
      body : Center(
        child: Column(
            children: [
              Text("세로 정렬 첫번째 위젯1") ,
              Text("세로 정렬 첫번째 위젯2") ,
              TextButton(onPressed: increment, child: Text("세로 정렬 첫번째 위젯3") , ),
              Text("세로 정렬 첫번째 위젯4 COUNT : ${ count }")
            ], ) , ) ,

    )
    );
  }
}// class end
// 리액트 :