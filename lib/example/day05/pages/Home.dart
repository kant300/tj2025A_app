import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();  // 전역으로 설정해서 모두가 사용

class Home extends StatefulWidget{   // 상태있는 위젯
  HomeState createState() => HomeState();  // 홈이라는 상태있는 위젯 생성
}

class HomeState extends State<Home>{
  @override void initState() { // 1. 위젯이 최초로 열렸을때 실행하는 함수
    findAll();
  }
  List< dynamic > todoList = []; // 3. 가져온 todo목록
  void findAll() async{ // 2. Spring 서버로 부터 todo (전체)목록 가져오기
    try{
      final response = await dio.get( "http://192.168.40.61:8080/api/todo" );
      final data = await response.data;
      setState(() { todoList = data;  });
      print(data);
    }catch(e){ print(e);}
  }

  void delete( int id ) async{ // 4. Spring 서버로 부터 개별 삭제 한다.
    try{
      final response = await dio.delete("http://192.168.40.61:8080/api/todo?id=${id}");
      final data = await response.data; print(data);
      if( data == true ){ findAll(); }
    }catch(e){print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("TODO"),),
      body: Center(
        child: Column(
          children: [
            Expanded(child: ListView(
              // children: [], // 반복문을 이용하여 ListView에 여러개 Cart 대입
              // todoList.map( (반복변수명){ return 반환위젯() } ).toList();
              children: todoList.map( (todo){ // map 반복문은 dynamic 타입 매핑 안된다.
                return Card( child: ListTile(
                  title: Text( todo['title']),  // Card 제목 부분
                  subtitle: Row(children: [Text(todo['content']), Text(todo['createDate'])],),
                  trailing: Row(  // Row : 가로 배치 위젯
                    mainAxisSize: MainAxisSize.min, // Row 배치에서 오른쪽 버튼(윗젯)들의 넓이를 자동으로 최소크기 할당
                    children: [
                      IconButton(onPressed: (){ delete( todo['id'] ); } , icon: Icon( Icons.delete ) ),
                      IconButton(onPressed: ()async{
                        final result = await Navigator.pushNamed( context, "/update" , arguments: todo['id'] );
                        print( result );
                        // 만약에 push 한 위젯이 pop했을때 반환값 받아서 특정 로직 구현
                        if( result == true ){ findAll(); }
                        },
                          icon: Icon( Icons.edit ) ) ,
                      IconButton( // Navigator.pushName( context{현위젯} , "{이동할경로}" , arguments : {매개변수} );
                          onPressed: (){ Navigator.pushNamed( context, "/detail" , arguments: todo['id'] ); },
                          icon: Icon( Icons.info ) ),
                    ],

                  ),
                ), );
              }).toList(), // map end
            )),
          ],
        ),
      ),
    );
  }
}