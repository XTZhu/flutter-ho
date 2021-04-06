// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    print("测试数据");

    //创建一个数组
    List<int> testList = [1,2,3,1,2,1,1,4,5,6,2,34,];


    Map<String,List<int>> map = Map();

    testList.forEach((element) {
      if(map.containsKey("$element")){
        List<int> valueList = map["$element"];
        valueList.add(element);
      }else{
        map["$element"]=[element];
      }
    });



    ///final String message = 'Hello World';
    // 直接赋值
    const String message = 'Hello World';
    //结合其他 const 变量
    const String message2 = message+"WAWA";


  });



}
