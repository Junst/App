import 'dart:convert';

import 'package:myapp/model/record.dart';
import 'package:http/http.dart' as http;

class RecordsApi {
  static Future<List<Record>> getRecords(String query) async {
    final url = Uri.parse(
        'https://gist.githubusercontent.com/JohannesMilke/d53fbbe9a1b7e7ca2645db13b995dc6f/raw/eace0e20f86cdde3352b2d92f699b6e9dedd8c70/books.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List records = json.decode(response.body);

      return records.map((json) => Record.fromJson(json)).where((record) {
        final titleLower = record.name.toLowerCase();
        final describeLower = record.describe.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            describeLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
