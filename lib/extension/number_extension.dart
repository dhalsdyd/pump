// string 객체 활장 클래스 파일
import 'package:intl/intl.dart';

extension StringExtension on String {
  String numberFormat() {
    final formatter = NumberFormat("#,###");
    return formatter.format(int.parse(this));
  }
}

extension DoubleExtension on double {
  String numberFormat() {
    String result = toString();

    final formatter = NumberFormat("#,###");
    return formatter.format(int.parse(result));
  }
}

extension IntExtension on int {
  String numberFormat() {
    String result = toString();

    final formatter = NumberFormat("#,###");
    return formatter.format(int.parse(result));
  }
}
