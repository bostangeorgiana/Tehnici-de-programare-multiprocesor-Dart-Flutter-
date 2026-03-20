import 'dart:convert';
import 'json_utils.dart';

void main() {
  final rezultat = jsonSumJson('fisier1.json', 'fisier2.json');
  print(jsonEncode(rezultat));
}
