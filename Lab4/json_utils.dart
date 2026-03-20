import 'dart:convert';
import 'dart:io';

Map<String, dynamic> jsonSumJson(String jsonPath1, String jsonPath2) {
  final file1 = File(jsonPath1);
  final file2 = File(jsonPath2);

  final map1 = jsonDecode(file1.readAsStringSync()) as Map<String, dynamic>;
  final map2 = jsonDecode(file2.readAsStringSync()) as Map<String, dynamic>;

  return _mergeMaps(map1, map2);
}

Map<String, dynamic> _mergeMaps(
  Map<String, dynamic> map1,
  Map<String, dynamic> map2,
) {
  final result = <String, dynamic>{};

  for (final entry in map1.entries) {
    result[entry.key] = entry.value;
  }

  for (final entry in map2.entries) {
    final key = entry.key;
    final value2 = entry.value;

    if (result.containsKey(key) &&
        result[key] is Map<String, dynamic> &&
        value2 is Map<String, dynamic>) {
      result[key] = _mergeMaps(result[key] as Map<String, dynamic>, value2);
    } else {
      result[key] = value2;
    }
  }

  return result;
}
