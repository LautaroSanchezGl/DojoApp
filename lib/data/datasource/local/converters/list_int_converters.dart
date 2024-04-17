import 'dart:convert';

import 'package:floor/floor.dart';

class ListIntConverter extends TypeConverter<List<int>, String> {
  @override
  List<int> decode(String databaseValue) {
    return List<int>.from(jsonDecode(databaseValue)['genre_ids']);
  }

  @override
  String encode(List<int> value) {
    var map = <String, List<int>>{};
    map.addAll({'genre_ids': value});
    return jsonEncode(map);
  }
}
