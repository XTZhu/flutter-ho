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
    List<int> testList = [];

    //添加数据
    testList.add(2);
    testList.add(2);
    testList.add(2);
    testList.add(2);

    print("测试数据 - $testList");

    //插入数据 在0号位置插入一个数据
    testList.insert(0, 33);

    print("测试数据 - $testList");





  });
}
