// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    print("Gzip压缩");

    //原始字符串
    String myString = 'myString';
    //gzip 压缩后的文本
    String zipString = gzipEncode(myString);

    print("gzip 编码-$zipString");

    //gzip 解压
    String zipString2 = gzipDencode(zipString);

    print("gzip 解编码-$zipString2");
  });
}

///GZIP 压缩
String gzipEncode(String str) {
  //先来转换一下
  List<int> stringBytes = utf8.encode(str);
  //然后使用 gzip 压缩
  List<int> gzipBytes = new GZipEncoder().encode(stringBytes);
  //然后再编码一下进行网络传输
  String compressedString = base64UrlEncode(gzipBytes);
  return compressedString;
}

///GZIP 解压缩
String gzipDencode(String str) {
  //先来解码一下
  List<int> stringBytes = base64Url.decode(str);
  //然后使用 gzip 压缩
  List<int> gzipBytes = new GZipDecoder().decodeBytes(stringBytes);
  //然后再编码一下
  String compressedString = utf8.decode(gzipBytes);
  return compressedString;
}
