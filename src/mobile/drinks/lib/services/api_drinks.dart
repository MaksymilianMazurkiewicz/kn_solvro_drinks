import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_results.dart';
import '../models/drink.dart';

class DrinksProxyService {
  final String baseUrl = "https://cocktails.solvro.pl/api/v1";

  Future <ApiResults<Drink>> getAllAsync(int? page, int? pageSize) async {
    final url = Uri.parse('$baseUrl/cocktails?page=${page ?? 1}&perPage=${pageSize ?? 15}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return ApiResults.fromJson(json.decode(response.body), Drink.fromJson);
    }
    throw Exception("Faild to load list drinks");
  }
}