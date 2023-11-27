import 'dart:convert';

parseAbnSopResponseToJson(value) {
  int jsonStart = value.indexOf('{');
  int jsonEnd = value.lastIndexOf('}');
  var jsonObjectString = value.substring(jsonStart, jsonEnd + 1);
  return jsonDecode(jsonObjectString);
}
