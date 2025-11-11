import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Detail extends StatefulWidget{
  DetailState createState() => DetailState();

}
class DetailState extends State<Detail>{

  // 1. 해당 위젯이 최초로 열렸을대 함수
  @override void initState() { }
  // 2. 이전(부모)위젯이 변경되었을때 실행 함수. <렌더링>
  @override void didChangeDependencies() {
    // 부모 위젯에서 상세버튼 클릭할때마다 서로 다른 매개변수를 가져온다.
    // ModalRoute.of( context )!.settings.arguments as 타입; 부모가 전달한 arguments를 가져온다.
    //  ModalRoute.of( context ).settings.arguments as 타입; 안가져온다.
    int id = ModalRoute.of( context )!.settings.arguments as int;
    findById( id );
  }
  // 3. Spring 서버로부터 개별 조회한다.
  dynamic todo = {};
  void findById( int id ) async {
    try{
      final response = await dio.get("http://192.168.40.133:8080/api/todo/detail?id=${id}");
      final data = await response.data; print(data);
      setState(() { todo = data; });
    }catch(e){ print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("TODO 상세"),),
        body: Padding(
            padding : EdgeInsets.fromLTRB( 40 , 60 , 40 , 40  ) , // 안쪽 여백 ,
            child: Column( // 안쪽 여백
              crossAxisAlignment : CrossAxisAlignment.start , // 세로 배치 방법에서 왼쪽 정렬 , end(오른쪽), center(가운데)
              children: [
                Text( "제목 : ${ todo['title'] }" , style: TextStyle( fontSize: 20 ) ) ,
                SizedBox( height:  10 ),
                Text( "내용 : ${ todo['content'] }" , style:  TextStyle( fontSize: 18 , color: Colors.pink ) ) ,
                SizedBox( height: 20 ,) ,
                Text( "완료 여부 : ${ todo['done'] == true ? '완료' : '미완료'}" , style: TextStyle( fontSize: 18 ),),
                SizedBox( height: 20 , ) ,
                Text( "등록일 : ${ todo['createDate'] }" , style: TextStyle( fontSize: 18), ) ,
              ],
            )
        )
    );
  }
}
