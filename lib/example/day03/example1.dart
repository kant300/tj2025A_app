/*
  -- 주요 통신 기술
  JS : Fetch      , JQUERY : AJAX
  REACT : Axios   , Flutter : DIO
  -- Flutter 라이브러리 공유 페이지 : https://pub.dev/
  SPRING : build.gradle
  JS : CDN


 */

import 'package:dio/dio.dart';

final dio = Dio(); // dio 상수에 Dio 객체를 저장한다.


// [1] GET방식의 요청 함수
void getEvent() async{ // dart 의 람다식/익명함수는 ()=>{} < (){}
  try{
    // final response = await dio.get("URL");
    final response = await dio.get("https://jsonplaceholder.typicode.com/posts/1");
    print("[GET] 성공 ${response.data} } ");
  }catch(e){ print("[GET] 실패 ${e}"); } // dart 의 문자열 템플릿
}
// [2] POST 방식의 요청 함수
void postEvent() async{
  try{
    final obj = { 'title' : 'foo' , 'body' : 'bar' , 'userId' : 1 }; // 보낼데이터
    final response = await dio.post("https://jsonplaceholder.typicode.com/posts" , data : obj);
    print( "[POST] 성공 : ${ response.data }");
  }catch(e){ print( "[POST]실패 ${e}"); }
}
void main(){
  print("다트 프로그램 시작점");
  getEvent(); // [1-2] 호출
  postEvent(); // [2-2] 호출


} // main e